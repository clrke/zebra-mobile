import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/forms/createPostForm.dart';
import 'package:zero_mobile/providers/PollProvider.dart';
import 'package:zero_mobile/repositories/pollRepository.dart';
import '../components/loader.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      createPoll();
    });
  }

  createPoll() async{
    return await PollRepository.createPoll();
  }

  onSubmit(caption) async{
    setState(() {
      loading = true;
    });
    await PollRepository.savePoll(caption: caption);
    setState(() {
      loading = false;
    });
    Provider.of<PollProvider>(context,listen: false).resetFields();
    Navigator.pushReplacementNamed(context, '/results');
  }

  @override
  Widget build(BuildContext context) {
    var body = CreatePostForm(onSubmit: onSubmit);
    var bodyProgress = Loader(body: body);

    return Container(
        child: loading ? bodyProgress : body
    );
  }
}
