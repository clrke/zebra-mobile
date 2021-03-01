import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/atmos/zebra-mobile/lib/screens/home.dart';
import 'file:///C:/atmos/zebra-mobile/lib/screens/login.dart';

class NonAuthRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=>Login());
      case '/home':
        return MaterialPageRoute(builder: (_)=>Home());
      default:
        return null;
    }
  }
}

class AuthRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_)=>Home());
      default:
        return null;
    }
  }
}
