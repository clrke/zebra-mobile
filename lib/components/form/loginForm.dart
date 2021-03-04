import 'package:flutter/material.dart';
import 'package:zero_mobile/components/appButton.dart';
import 'package:zero_mobile/components/appTextField.dart';
import '../../screens/post.dart';
import '../appLogo.dart';

class LoginForm extends StatefulWidget {
  final ValueChanged onSubmit;

  LoginForm({this.onSubmit});

  @override
  _LoginFormState createState() => _LoginFormState(onSubmit: onSubmit);
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  ValueChanged onSubmit;

  _LoginFormState({this.onSubmit});

  loginAction() {
    if (_formKey.currentState.validate()) {
      String username = _usernameController.value.text;
      String password = _passwordController.value.text;
      Map<String, dynamic> data = {'username': username, 'password': password};
      onSubmit(data);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => Post())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final fontSize = height * 0.025;

    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.03),
                  child: AppLogo(),
                )),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.02,
                      bottom: height * 0.01,
                      top: height * 0.02),
                  child: Text(
                    'Username',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
                AppTextField(
                  controller: _usernameController,
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return 'Username is required';
                    }
                  },
                  hintText: '+63',
                  obscureText: false,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.02,
                      bottom: height * 0.01,
                      top: height * 0.04),
                  child: Text(
                    'Password',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
                AppTextField(
                  controller: _passwordController,
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Your password must contain at least 8 to 16 characters, a combination of upper and lowercase letters, and at least one number or symbol.';
                    }
                  },
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Center(
                  child: AppButton(
                      onPressed: loginAction,
                      text: 'LOG IN',
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.12,
                          vertical: height * 0.025
                      )
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
