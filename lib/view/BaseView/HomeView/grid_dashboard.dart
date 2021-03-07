import 'package:flutter/material.dart';
import 'package:pricer_project/view/widget/category_layout.dart/furniture_layout.dart';
import 'package:pricer_project/view/widget/category_layout.dart/hobby_layout.dart';
import 'package:pricer_project/view/widget/category_layout.dart/laptop_layout.dart';
import 'package:pricer_project/view/widget/category_layout.dart/phone_layout.dart';
import 'package:pricer_project/view/widget/layout.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Items> list = [
      new Items(
        title: "Hobby",
        image: "assets/images/hobby.png",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Layout(
                appbar: 'Hobby Category',
                content: HobbyPage(),
              ),
            ),
          );
        },
      ),
      new Items(
        title: "Mobile Phone",
        image: "assets/images/mobile.png",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Layout(
                appbar: 'Mobile Phone Category',
                content: PhonePage(),
              ),
            ),
          );
        },
      ),
      new Items(
        title: "Furniture",
        image: "assets/images/furniture.png",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Layout(
                appbar: 'Furniture Category',
                content: FurniturePage(),
              ),
            ),
          );
        },
      ),
      new Items(
        title: "Laptop",
        image: "assets/images/laptop.png",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Layout(
                appbar: 'Laptop Category',
                content: LaptopPage(),
              ),
            ),
          );
        },
      ),
    ];

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: list.map((data) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
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
              onTap: data.onPressed,
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String name;
  String image;
  Function onPressed;

  Items({this.title, this.name, this.image, this.onPressed});
}
