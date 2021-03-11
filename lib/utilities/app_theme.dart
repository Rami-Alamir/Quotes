import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: 'Bitter',
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(106, 20, 191, 1),
    accentColor: Color.fromRGBO(255, 255, 255, 1),
    splashColor: Colors.white,
    backgroundColor: Color.fromRGBO(245, 245, 245, 1),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
      subtitle1: TextStyle(color: Colors.black45, fontSize: 18),
      headline1: TextStyle(
          color: Color.fromRGBO(106, 20, 191, 1),
          fontSize: 40,
          fontWeight: FontWeight.normal),
      headline2: TextStyle(
          color: Colors.black45, fontSize: 18, fontWeight: FontWeight.normal),
    ),
  );
}
