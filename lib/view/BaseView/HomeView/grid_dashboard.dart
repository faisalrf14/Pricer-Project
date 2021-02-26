import 'package:flutter/material.dart';
import 'package:pricer_project/view/widget/layout.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Items> list = [  
      new Items(
        title: "Hobby",
        image: "assets/images/gaming.png",
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => Layout(
              appbar: 'Hobby Category'
            )),
      );
        },
      ),
      new Items(
        title: "Laptop",
        image: "assets/images/gaming.png",
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => Layout(
              appbar: 'Laptop Category',
            )),
      );
        },
      ),
      new Items(
        title: "Furniture",
        image: "assets/images/gaming.png",
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => Layout(
              appbar: 'Furniture Category',
              categoryName: 'Laptop',
              categoryImage: ''
            )),
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
                      height: 1,
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

class Carousel {
  String categoryName;
  String categoryImage;
  Function onPressed;

  Carousel({this.categoryName, this.categoryImage, this.onPressed});
}