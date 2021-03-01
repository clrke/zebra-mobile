import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zero_mobile/constants/theme.dart';

class AppContainer extends StatefulWidget {
  final Widget child;
  final String title;

  AppContainer({@required this.child, @required this.title});

  @override
  _AppContainerState createState() =>
      _AppContainerState(child: this.child, title: this.title);
}

class _AppContainerState extends State<AppContainer> {
  bool isToggle = false;
  int _currentIndex = 0;

  final Widget child;
  final String title;

  _AppContainerState({@required this.child, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(color: theme['primary']),
          ),
          actions: [
            Switch(
              value: isToggle,
              onChanged: (value) {
                setState(() {
                  isToggle = !isToggle;
                });
              },
              inactiveThumbColor: theme['primary'],
              inactiveTrackColor: theme['secondary'],
              activeTrackColor: theme['primary'],
            ),
          ],
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.help,
              color: theme['primary'],
            ),
            onPressed: () {
              print('i am being clicked');
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: child,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: '',),
            BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.people_rounded), label: ''),
          ],
          iconSize: 32.0,
          type : BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
       )
    );
  }
}
