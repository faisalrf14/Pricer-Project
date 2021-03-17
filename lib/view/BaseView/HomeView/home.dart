import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/logic/auth/auth_bloc.dart';
import 'package:pricer_project/services/service_session_manager.dart';
import 'package:pricer_project/view/BaseView/HomeView/grid_dashboard.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String email;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getCurrentUser() async {
    String userEmail = await SessionManagerService().getUser();
    setState(() {
      this.email = userEmail.split("@").first;
    });
  }

  _handleLogout() {
    BlocProvider.of<AuthBloc>(context).add(UserLoggedOut());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 110,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome! " + this.email ?? "",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              IconButton(
                alignment: Alignment.topCenter,
                icon: Icon(Icons.logout),
                onPressed: () => _handleLogout(),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        Dashboard()
      ],
    );
  }
}
