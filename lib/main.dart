import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/logic/simple_bloc_observer.dart';
import 'package:pricer_project/view/BaseView/LoginView/bloc/login_bloc.dart';
import 'package:pricer_project/view/BaseView/PageManagement/page_bloc.dart';
import 'package:pricer_project/view/BaseView/base_view.dart';

Future<void> main() async {
  try {
    Bloc.observer = SimpleBlocObserver();
  } catch (e) {
    print(e);
  }

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PageBloc>(create: (context) => PageBloc()),
      BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PageBloc>(context).add(SelectedPage(pageState: 'Home'));
    return MaterialApp(
      home: BaseView(),
    );
  }
}
