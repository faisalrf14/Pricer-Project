import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HobbyPage extends StatefulWidget {
  @override
  _HobbyPageState createState() => _HobbyPageState();
}

class _HobbyPageState extends State<HobbyPage> {
  @override
  Widget build(BuildContext context) {
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
              Card(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/hobby/game.png'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Gaming',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/hobby/foto.jpg'),
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
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
                          'Photography',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/hobby/sport.jpg'),
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
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
                          'Sport',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                      )
                    ],
                  ),
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
        ],
      ),
    );
  }
}
