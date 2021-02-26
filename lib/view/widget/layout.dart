import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pricer_project/view/BaseView/HomeView/grid_dashboard.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
  final Items x;
  final String appbar;
  Layout({this.x, this.appbar, categoryName, categoryImage});
}

class _LayoutState extends State<Layout> {
  // final List<String> _listItem = [
  //   'assets/images/shop.jpg',
  //   'assets/images/computer.png',
  //   'assets/images/gaming.png',
  //   'assets/images/shop.jpg',
  //   'assets/images/computer.png',
  //   'assets/images/gaming.png',
  //   'assets/images/shop.jpg',
  //   'assets/images/computer.png',
  //   'assets/images/gaming.png',
  //   'assets/images/gaming.png',
  // ];

  // final listMarket = <ChoiceMarket>[
  //   ChoiceMarket(1, 'Tokopedia'),
  //   ChoiceMarket(2, 'Shoppee'),
  //   ChoiceMarket(3, 'Bukalapak'),
  // ];
  var idSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(widget.appbar),
          centerTitle: true,
          backgroundColor: Colors.orange),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 38, vertical: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide:
                            BorderSide(width: 0, color: Colors.transparent)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search",
                    fillColor: Colors.orange[100],
                    filled: true,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: Wrap(
                  //     children: listMarket
                  //         .map((e) => ChoiceChip(
                  //               label: Text(e.label),
                  //               selected: idSelected == e.id,
                  //               onSelected: (_) =>
                  //                   setState(() => idSelected = e.id),
                  //             ))
                  //         .toList(),
                  //     spacing: 8,
                  //   ),
                  // ),
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
                            image:
                                AssetImage('assets/images/laptop_gaming.jpg'),
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
                                'Gaming Laptop Testing',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0),
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
                            image: AssetImage('assets/images/laptop_kerja.jpg'),
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
                                'Office Laptop',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0),
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
                            image:
                                AssetImage('assets/images/laptop_content.jpg'),
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
                                'Content Creator Laptop',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0),
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
                    child: Text('Recommended for you'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceMarket {
  final int id;
  final String label;

  ChoiceMarket(this.id, this.label);
}

class Carousel {
  String title;
}