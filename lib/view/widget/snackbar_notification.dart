import 'package:flutter/material.dart';

class WidgetNotificationSnackbar {
  WidgetNotificationSnackbar();

  render({
    required BuildContext context,
    required Color color,
    required String message,
  }) {
    // ignore: deprecated_member_use
    return Scaffold.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(15),
        duration: Duration(milliseconds: 1200),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: Text(message),
      ),
    );
  }
}
