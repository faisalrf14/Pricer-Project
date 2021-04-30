import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final String productName;
  final String shopLocation;

  DetailView({this.productName, this.shopLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Name : ' + productName),
            Text('Location : ' + shopLocation),
          ],
        ),
      ),
    );
  }
}
