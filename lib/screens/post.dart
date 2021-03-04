import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/form/createPostForm.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';
import '../components/loader.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool loading = false;
  String title = "Create Post";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<HomeProvider>(context,listen: false).changeTitle(title: title);
    });
  }

  @override
  Widget build(BuildContext context) {
    var body = CreatePostForm();
    var bodyProgress = Loader(body: body);

    return Container(
        child: loading ? bodyProgress : body
    );
  }
}
