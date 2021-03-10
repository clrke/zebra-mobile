import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/loader.dart';
import 'package:zero_mobile/forms/loginForm.dart';
import 'package:zero_mobile/repositories/userRepository.dart';
import 'package:zero_mobile/utils/dialog.dart';
import 'package:zero_mobile/utils/localStorage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;

  void loginAction(Map<String,dynamic> formData) async {
    setState(() {
      loading=true;
    });

    Map<String,dynamic> userResponse = await UserRepository.login(
        username: formData['username'],
        password: formData['password']
    );

    setState(() {
      loading=false;
    });

    if(userResponse['statusCode'] == 400) {
      Map<String,dynamic> responseJson = jsonDecode(userResponse['data']);
      String error = responseJson['error_description'];
      Dialogs.dialog(context,error);
      return;
    } else if (userResponse['statusCode'] == 200) {
      LocalStorage.storeLocalStorage('_surgeonId', userResponse['surgeon']['id']);
      LocalStorage.storeLocalStorage('_token', userResponse['accessToken']);
      LocalStorage.storeLocalStorage('_refreshToken', userResponse['refreshToken']);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        loading=false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var body = LoginForm(onSubmit:(value) => loginAction(value));
    var bodyProgress = Loader(body: body);
    return Scaffold(
      body: Container(
          child: loading ? bodyProgress : body
      ),
    );
  }
}





