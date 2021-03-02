import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/screens/home.dart';
import 'package:zero_mobile/screens/login.dart';
import 'package:zero_mobile/screens/account.dart';
import 'package:zero_mobile/screens/call.dart';
import 'package:zero_mobile/screens/operation.dart';
import 'package:zero_mobile/screens/post.dart';

class NonAuthRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_)=>Login());
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
      case '/call':
        return MaterialPageRoute(builder: (_)=>Call());
      case '/account':
        return MaterialPageRoute(builder: (_)=>Account());
      default:
        return throw Exception('Invalid route: ${settings.name}');
    }
  }
}

