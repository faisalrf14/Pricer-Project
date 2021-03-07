import 'package:flutter/material.dart';
import 'package:pricer_project/view/BaseView/HomeView/grid_dashboard.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
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
                  Text("Username"),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Email"),
                ],
              ),
              IconButton(
                alignment: Alignment.topCenter,
                icon: Icon(Icons.logout),
                onPressed: () {},
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
