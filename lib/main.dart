import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/data/dataprovider/api.dart';
import 'package:pricer_project/data/repositories/user_repositories.dart';
import 'package:pricer_project/logic/auth/auth_bloc.dart';
import 'package:pricer_project/logic/simple_bloc_observer.dart';
import 'package:pricer_project/view/BaseView/LoginView/bloc/login_bloc.dart';
import 'package:pricer_project/view/BaseView/bloc/page_bloc.dart';
import 'package:pricer_project/view/BaseView/base_view.dart';
import 'package:pricer_project/view/HomeView/home.dart';
import 'package:pricer_project/view/Widget/snackbar_notification.dart';

Future<void> main() async {
  try {
    Bloc.observer = SimpleBlocObserver();
  } catch (e) {
    print(e);
  }

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(create: (context) => UserRepository(pricerApi: PricerApi())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(userRepository: UserRepository(pricerApi: PricerApi()))..add(AppLoaded())),
          BlocProvider<LoginBloc>(create: (context) => LoginBloc(userRepository: UserRepository(pricerApi: PricerApi()), authBloc: BlocProvider.of<AuthBloc>(context))),
          BlocProvider<PageBloc>(create: (context) => PageBloc()..add(SelectedPage(pageState: 'Login'))),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthAuthenticated) {
                return MyHome(email: state.userEmail);
              }
              if (state is AuthNotAuthenticated) {
                return BaseView();
              }
              if (state is AuthFailure) {
                WidgetNotificationSnackbar().render(context: context, color: Colors.red, message: state.message);
              }

              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
