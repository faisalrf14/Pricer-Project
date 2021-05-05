import 'package:flutter/material.dart';
import 'package:pricer_project/data/constant.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: categoryList.map((data) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.image,
                    width: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.title,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => data.content,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
