import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FurniturePage extends StatefulWidget {
  @override
  _FurniturePageState createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  @override
  Widget build(BuildContext context) {
    List<Items> list = [
      new Items(
        title: "Hobby",
        image: "assets/images/gaming.png",
      ),
      new Items(
        title: "Laptop",
        image: "assets/images/computer.png",
      ),
      new Items(
        title: "Furniture",
        image: "assets/images/furniture.png",
      ),
      new Items(
        title: "Hobby",
        image: "assets/images/gaming.png",
      ),
      new Items(
        title: "Laptop",
        image: "assets/images/computer.png",
      ),
      new Items(
        title: "Furniture",
        image: "assets/images/furniture.png",
      ),
    ];

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
          ),
          CarouselSlider(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
            items: [
              Container(
                margin: EdgeInsets.all(5.0),
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/furniture/bedroom.jpg'),
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Bedroom',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/furniture/livingroom.jpg'),
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Living Room',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/furniture/kitchen.jpg'),
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Kitchen',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Recommend for you!',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SingleChildScrollView(
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
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
                    );
                  }).toList()),
            ),
          ),
        ],
      ),
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
