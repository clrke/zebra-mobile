import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/atmos/zebra-mobile/lib/components/functions/appBar.dart';
import 'package:zero_mobile/utils/routes.dart';

import 'functions/bottomNavBar.dart';

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  List<Map<String, dynamic>> routeList = [
    {'route': '/', 'title': 'Operation'},
    {'route': '/call', 'title': 'Emergency Call'},
    {'route': '/post', 'title': 'Create a Post'},
    {'route': '/account', 'title': 'Account'}
  ];

  bool isToggle = false;
  int _currentIndex = 0;
  String title = 'Operation';

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
          print(1);
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
          _navigatorKey.currentState
              .pushReplacementNamed(routeList[bottomNavIndex]['route']);
        }
      )
    );
  }
}
