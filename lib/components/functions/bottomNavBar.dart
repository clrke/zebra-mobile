import 'package:flutter/material.dart';

class BottomNavBar {
  static List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: '',),
    BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.call), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.people_rounded), label: ''),
  ];

  static BottomNavigationBar bottomBar({@required int currentIndex,@required ValueChanged onSelectNav}) {
    return BottomNavigationBar(
      items: bottomItems,
      iconSize: 32.0,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) {
        onSelectNav(index);
      },
    );
  }
}