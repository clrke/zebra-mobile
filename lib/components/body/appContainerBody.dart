import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/functions/appBar.dart';
import 'package:zero_mobile/components/functions/bottomNavBar.dart';
import 'package:zero_mobile/utils/routes.dart';

class AppContainerBody extends StatefulWidget {
  @override
  _AppContainerBodyState createState() => _AppContainerBodyState();
}

class _AppContainerBodyState extends State<AppContainerBody> {
  List<Map<String, dynamic>> routeList = [
    {'route': '/', 'title': 'Operation'},
    {'route': '/call', 'title': 'Emergency Call'},
    {'route': '/post', 'title': 'Create a Post'},
    {'route': '/account', 'title': 'Account'}
  ];

  String title = 'Operation';
  bool isToggle = false;

  int _currentIndex = 0;

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ContainerAppBar.appBar(
            title: title,
            isToggle: isToggle,
            onSwitch: (value) {
              setState(() {
                isToggle = !isToggle;
              });
            },
            iconPress: () {
              print('help being tap');
            }
        ),
        body: Navigator(
          key: _navigatorKey,
          initialRoute: '/',
          onGenerateRoute: AuthRoute.generateRoute,
        ),
        bottomNavigationBar: BottomNavBar.bottomBar(
            currentIndex: _currentIndex,
            onSelectNav: (bottomNavIndex) {
              setState(() {
                _currentIndex = bottomNavIndex;
                title = routeList[bottomNavIndex]['title'];
              });
              _navigatorKey.currentState.pushReplacementNamed(
                  routeList[bottomNavIndex]['route']);
            }
        )
    );
  }
}

