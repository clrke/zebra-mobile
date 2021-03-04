import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/form/createPostForm.dart';
import '../components/functions/appBar.dart';
import '../components/functions/bottomNavBar.dart';
import '../components/loader.dart';
import '../components/functions/appBar.dart';

int _currentIndex = 2;

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var body = CreatePostForm();
    var bodyProgress = Loader(body: body);
    return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(100),
        //   child: ContainerAppBar(),
        // ),

        body: Container(
          child: loading ? bodyProgress : body
        ),
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
