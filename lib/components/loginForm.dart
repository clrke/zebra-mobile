import 'package:flutter/material.dart';
import 'buttons/forgotPasswordButton.dart';
import 'buttons/loginButton.dart';
import 'package:zero_mobile/components/appLogo.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: AppLogo()),
              SizedBox(height: 30.0),
              Center(
                child: Text(
                  'Zero BDI App',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )
                )
              ),

              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "+63",
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
              ),

              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                'Your password must contain at least 8 to 16 characters, a combination of upper and lowercase letters, and at least one number or symbol.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                )
              ),
              SizedBox(height: 5.0),
              Center(child: ForgotPasswordButton()),
              SizedBox(height: 5.0),
              Center(child: LoginButton()),
            ],
        )
      ),
    );
  }
}
