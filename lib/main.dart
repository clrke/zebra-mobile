import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/loader.dart';
import 'package:zero_mobile/repositories/userRepository.dart';
import 'package:zero_mobile/utils/apiInstance.dart';
import 'package:zero_mobile/utils/localStorage.dart';
import 'package:zero_mobile/utils/routes.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'constants/settings.dart';
import 'models/tokenModel.dart';
import 'package:dio/dio.dart';
import './utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuthenticate = false;

  getToken() async {
    String token = await LocalStorage.readLocalStorage('_token');
    setState(() {
      isAuthenticate = token == null ? false : true;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getToken();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isAuthenticate ? '/' : '/login',
      onGenerateRoute: isAuthenticate ? AuthRoute.generateRoute : NonAuthRoute.generateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(color: Colors.transparent,elevation: 0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isAuthenticate ? Home() : Login(),
    );
  }
}






