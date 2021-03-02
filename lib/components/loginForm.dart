import 'package:flutter/material.dart';
import 'package:zero_mobile/components/formWidgets/customTextLabel.dart';
import 'package:zero_mobile/components/formWidgets/customTextField.dart';
import 'package:zero_mobile/components/buttonWidgets/forgotPasswordButton.dart';
import 'package:zero_mobile/components/buttonWidgets/loginButton.dart';
import 'file:///C:/Users/raphn/Desktop/android-studio-projects/zebra-bdi/zebra-mobile/lib/components/functions/appLogo.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(height: 80.0),
                  // App Logo
                  Center(child: AppLogo()),
                  Center(
                    child: Text(
                      'Zero BDI App',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )
                    )
                  ),

                  // Username Text Box
                  SizedBox(height: 30.0),
                  CustomTextLabel(labelText: 'Username'),
                  SizedBox(height: 5.0),
                  CustomTextField(hintText: '+63', obscureText: false),

                  // Password TextBox
                  SizedBox(height: 20.0),
                  CustomTextLabel(labelText: 'Password'),
                  SizedBox(height: 5.0),
                  CustomTextField(hintText: 'Enter Password', obscureText: true),

                  // Password Note
                  SizedBox(height: 20.0),
                  Text(
                    'Your password must contain at least 8 to 16 characters, a combination of upper and lowercase letters, and at least one number or symbol.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    )
                  ),

                  // Forgot Password Button
                  Center(child: ForgotPasswordButton()),
                  // Login Button
                  Center(child: LoginButton(
                    onPressed: () {
                      if (_formKey.currentState.validate())
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                    },
                  )),

                ],
            )
          ),
        ),
      ),
    );
  }
}
