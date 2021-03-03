import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/loader.dart';
import 'package:zero_mobile/components/screenLayouts/loginForm.dart';
import 'package:zero_mobile/constants/theme.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var body = LoginForm();
    var bodyProgress = Loader(body: body);
    return Scaffold(
      body: Container(
          child: loading ? bodyProgress : body
      ),
    );
  }
}

