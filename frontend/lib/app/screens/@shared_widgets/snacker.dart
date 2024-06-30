import 'package:flutter/material.dart';

class Sncaker {
  showSnack(BuildContext context, String title, {bool isError = false}) {
    Color color = Colors.black;
    if (isError) {
      color = Colors.redAccent;
    }
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title.toUpperCase().replaceAll('-', ' ')),
        backgroundColor: color,
      ),
    );
  }
}
