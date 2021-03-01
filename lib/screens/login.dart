import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/loader.dart';
import '../components/loginForm.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // var body = Center(child: Text('Login screen'),);
    var body = LoginForm();
    var bodyProgress = Loader(body: body);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
          child: loading ? bodyProgress : body
      ),
    );
  }
}

