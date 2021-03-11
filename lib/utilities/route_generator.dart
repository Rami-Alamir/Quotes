import 'package:flutter/material.dart';
import 'package:quotes/screens/home/favourite.dart';
import 'package:quotes/screens/home/home.dart';
import 'package:quotes/utilities/routing_constants.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (context) => Home());
      case FAVOURITE:
        return MaterialPageRoute(builder: (context) => Favourite());
    }
  }
}
