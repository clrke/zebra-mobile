import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/utils/localStorage.dart';
import 'package:zero_mobile/utils/routes.dart';
import 'constants/theme.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import './utils/routes.dart';

void main() => runApp(
  DevicePreview(
  enabled: true,
  builder: (context) => MyApp(), // Wrap your app
  ),
);

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
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder,
      onGenerateRoute: isAuthenticate ? AuthRoute.generateRoute : NonAuthRoute.generateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(color: Colors.transparent,elevation: 0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isAuthenticate ? Home() : Login(),
    );
  }
}






