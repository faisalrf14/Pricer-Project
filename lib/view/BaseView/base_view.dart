import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/view/BaseView/HomeView/home.dart';
import 'package:pricer_project/view/BaseView/PageManagement/page_bloc.dart';

import 'ItemsView/items_page.dart';
import 'LoginView/login.dart';
import 'RegisView/register.dart';

class BaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is PageLogin) {
          return LoginPage();
        }
        if (state is PageRegis) {
          return RegisPage();
        }
        // if (state is PageHome) {
        //   return MyHome();
        // }
        // if (state is PageItems) {
        //   return ItemsPage();
        // }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
