import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/functions/appBar.dart';
import 'package:zero_mobile/components/functions/bottomNavBar.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';
import 'package:zero_mobile/utils/routes.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';
import 'package:zero_mobile/utils/utils.dart';

class AppContainerBody extends StatefulWidget {
  @override
  _AppContainerBodyState createState() => _AppContainerBodyState();
}

class _AppContainerBodyState extends State<AppContainerBody> {
  List<Map<String, dynamic>> routeList = Utils.bottomNavigationRoutes();

  bool isToggle = false;

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final height = SizeConfig.screenHeight;
    int _currentIndex =
        Provider.of<HomeProvider>(context, listen: true).currentIndex;
    return Consumer<HomeProvider>(builder: (context, data, child) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: ContainerAppBar.appBar(
                fontSize: height * 0.03,
                title: data.appBarTitle,
                isToggle: isToggle,
                onSwitch: (value) {
                  setState(() {
                    isToggle = !isToggle;
                  });
                },
                iconPress: () {
                  print('help being tap');
                }),
            body: Navigator(
              key: _navigatorKey,
              initialRoute: '/',
              onGenerateRoute: AuthRoute.generateRoute,
            ),
            bottomNavigationBar: BottomNavBar.bottomBar(
                iconSize: height * 0.04,
                currentIndex: _currentIndex,
                onSelectNav: (bottomNavIndex) {
                  Provider.of<HomeProvider>(context, listen: false)
                      .setCurrentIndex(index: bottomNavIndex);
                  _navigatorKey.currentState
                      .pushReplacementNamed(routeList[bottomNavIndex]['route']);
                }));
    });
  }
}
