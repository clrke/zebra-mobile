import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/appBarWidgets/customAppBar.dart';
import 'package:zero_mobile/components/screenLayouts/createPost.dart';
import 'package:zero_mobile/components/functions/bottomNavBar.dart';

import '../components/functions/appBar.dart';

int _currentIndex = 2;

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: PostAppBar(barTitle: 'Create Post'),
      ),
      body: CreatePost(),
      bottomNavigationBar: BottomNavBar.bottomBar(
        currentIndex: _currentIndex,
        onSelectNav: (bottomNavIndex) {
          _currentIndex = bottomNavIndex;
          setState(() {});
        }
      )
    );
  }
}
