import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/screens/checklist.dart';
import 'package:zero_mobile/screens/home.dart';
import 'package:zero_mobile/screens/login.dart';
import 'package:zero_mobile/screens/account.dart';
import 'package:zero_mobile/screens/call.dart';
import 'package:zero_mobile/screens/operation.dart';
import 'package:zero_mobile/screens/post.dart';

class NonAuthRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_)=>Login());
      case '/home':
        return MaterialPageRoute(builder: (_)=>Home());
      default:
        return throw Exception('Invalid route: ${settings.name}');
    }
  }
}

class AuthRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=>Operation());
      case '/home':
        return MaterialPageRoute(builder: (_)=>Home());
      case '/checklist':
        return MaterialPageRoute(builder: (_)=>Checklist());
      case '/post':
        return MaterialPageRoute(builder: (_)=>Post());
      case '/call':
        return MaterialPageRoute(builder: (_)=>Call());
      case '/account':
        return MaterialPageRoute(builder: (_)=>Account());
      case '/logout':
        return MaterialPageRoute(builder: (_)=>Login());
      default:
        return throw Exception('Invalid route: ${settings.name}');
    }
  }
}

