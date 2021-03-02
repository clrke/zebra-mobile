import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
import '../components/loader.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var body = Center(
      child: Text('Login screen',
        style: TextStyle(
            color: theme['primary'],
            fontSize: 20.0),
      ),
    );
    var bodyProgress = Loader(body: body);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: loading ? bodyProgress : body
      ),
    );
  }
}

