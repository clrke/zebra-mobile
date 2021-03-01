import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/appContainer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isToggle = false;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        child: Column(
          children: [
            Text(' i am home'),
          ],
        ),
        title:'home'
    );
  }
}
