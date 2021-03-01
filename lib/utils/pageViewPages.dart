import 'package:flutter/material.dart';
import 'package:zero_mobile/screens/account.dart';
import 'package:zero_mobile/screens/operation.dart';
import 'package:zero_mobile/screens/post.dart';

class PageViewPage {

  static List<Widget> pages() {
    List<Widget> pages = [
      Operation(),
      Container(
        child: Center(
          child: Text('Test page'),
        ),
      ),
      Post(),
      Account(),
    ];
    return pages;
  }

  static pageTitle({@required int pageIndex}) {
    List<String> titles = [
      'On Going Operations',
      'Emergency Room',
      'Create a Post',
      'Account',
    ];
    return titles[pageIndex];
  }

}