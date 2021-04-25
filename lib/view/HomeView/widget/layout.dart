import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
  final String appbar;
  final Widget content;
  Layout({this.appbar, this.content});
}

class _LayoutState extends State<Layout> {
  var idSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.appbar),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: widget.content,
    );
  }
}
