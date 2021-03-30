import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/view/BaseView/bloc/page_bloc.dart';

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
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
