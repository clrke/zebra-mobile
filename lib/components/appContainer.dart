import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/screens/post.dart';
import 'package:zero_mobile/utils/pageViewPages.dart';
import 'package:zero_mobile/utils/routes.dart';

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  bool isToggle = false;
  int _currentIndex = 0;
  String title = PageViewPage.pageTitle(pageIndex: 0);

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

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
        body: PageView(
          controller: _pageController,
          onPageChanged: (newIndex){
            setState(() {
              _currentIndex = newIndex;
              title = PageViewPage.pageTitle(pageIndex: newIndex);
            });
          },
          children: PageViewPage.pages(),
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
            _pageController.jumpToPage(index);
          },
       )
    );
  }
}
