import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';

class BottomNavBar {
  static List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: '',),
    BottomNavigationBarItem(icon: Icon(Icons.call), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.people_rounded), label: ''),
  ];

  static BottomNavigationBar bottomBar({@required int currentIndex,@required ValueChanged onSelectNav,@required double iconSize}) {
    return BottomNavigationBar(
      items: bottomItems,
      iconSize: iconSize,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: theme['primary'],
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) {
        onSelectNav(index);
      },
    );
  }
}