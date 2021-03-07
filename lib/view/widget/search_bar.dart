import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0), borderSide: BorderSide(width: 0, color: Colors.transparent)),
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
