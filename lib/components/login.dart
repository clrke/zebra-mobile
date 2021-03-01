import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loader.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var body = Center(child: Text('Login screen'),);
    var bodyProgress = Loader(body: body);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: loading ? bodyProgress : body
      ),
    );
  }
}

