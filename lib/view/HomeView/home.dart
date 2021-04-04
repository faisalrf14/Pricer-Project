import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/logic/auth/auth_bloc.dart';
import 'package:pricer_project/view/HomeView/grid_dashboard.dart';

import 'widget/search_bar/search_bar.dart';

class MyHome extends StatefulWidget {
  final String email;

  MyHome({this.email});

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

  _getCurrentUser() {
    setState(() {
      this.email = widget.email.split("@").first;
    });
  }

  _handleLogout() {
    BlocProvider.of<AuthBloc>(context).add(UserLoggedOut());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Welcome! " + this.email ?? "",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.logout),
                        onPressed: () => _handleLogout(),
                      ),
                    ],
                  ),
                ),
                Dashboard(),
              ],
            ),
          ),
          SearchBar(),
        ],
      ),
    );
  }
}
