import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/screens/account.dart';
import 'package:zero_mobile/screens/operation.dart';
import 'file:///C:/atmos/zebra-mobile/lib/screens/home.dart';
import 'file:///C:/atmos/zebra-mobile/lib/screens/login.dart';
import 'package:zero_mobile/screens/post.dart';

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
      case '/':
        return MaterialPageRoute(builder: (_)=>Operation());
      case '/post':
        return MaterialPageRoute(builder: (_)=>Post());
      case '/account':
        return MaterialPageRoute(builder: (_)=>Account());
      default:
        return throw Exception('Invalid route: ${settings.name}');
    }
  }
}

