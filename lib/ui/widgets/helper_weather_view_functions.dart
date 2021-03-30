import 'package:flutter/material.dart';
import 'package:weather/ui/shared/app_colors.dart';

Widget cityLabel(String name, [Color textColor=primaryColor]) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(children: [
        FittedBox(
          child: Text(
            name.toUpperCase(),
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: textColor),
          ),
        ),
      ]),
    ),
  );
}

Widget weatherDescription(String description) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(children: [
        FittedBox(
          child: Text(
            description.toUpperCase(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor),
          ),
        ),
      ]),
    ),
  );
}

Widget smallDescriptionContent(String text, [Color textColor = primaryColor]) {
  return Center(
    child: FittedBox(
      child: Text(
        text,
        style: TextStyle(fontSize: 70.0, color: textColor),
      ),
    ),
  );
}

Widget largeDescriptionContent(String text, [Color textColor = primaryColor]) {
  return Center(
    child: FittedBox(
      child: Text(
        text,
        style: TextStyle(fontSize: 109.0, color: textColor),
      ),
    ),
  );
}
