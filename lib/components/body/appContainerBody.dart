import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/functions/appBar.dart';
import 'package:zero_mobile/components/functions/bottomNavBar.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';
import 'package:zero_mobile/utils/routes.dart';

class AppContainerBody extends StatefulWidget {
  @override
  _AppContainerBodyState createState() => _AppContainerBodyState();
}

class _AppContainerBodyState extends State<AppContainerBody> {
  List<Map<String, dynamic>> routeList = [
    {'route': '/', 'title': 'Operation'},
    {'route': '/call', 'title': 'Emergency Call'},
    {'route': '/post', 'title': 'Create Post'},
    {'route': '/account', 'title': 'Account'}
  ];

  bool isToggle = false;

  int _currentIndex = 0;

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context,data,child){
      return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: ContainerAppBar.appBar(
              title: data.appBarTitle,
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
                data.changeTitle(title: routeList[bottomNavIndex]['title']);
                setState(() {
                  _currentIndex = bottomNavIndex;
                });
                _navigatorKey.currentState.pushReplacementNamed(
                    routeList[bottomNavIndex]['route']);
              }
          )
      );
    });
  }
}

