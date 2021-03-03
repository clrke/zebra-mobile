import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
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

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final fontSize = height * 0.025;

    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.05),
                    child: AppLogo(),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.02,bottom: height * 0.01,top: height * 0.02),
                  child: Text('Username',style: TextStyle(fontSize: fontSize),),
                ),
                TextFormField(
                  controller: _usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String value){
                    if(value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: fontSize),
                  decoration: InputDecoration(
                      contentPadding:EdgeInsets.symmetric(vertical: width * 0.06,horizontal: height * 0.02),
                      hintText: '+63',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.02),
                        borderSide: BorderSide(
                          color: Colors.grey[500],
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.02),
                        borderSide: BorderSide(
                          color: Colors.grey[500],
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.02),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      errorStyle: TextStyle(fontSize: height * 0.02),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.02),
                      borderSide: BorderSide(
                        color: Colors.grey[500],
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.02,bottom: height * 0.01,top: height * 0.04),
                  child: Text('Password',style: TextStyle(fontSize: fontSize),),
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (String value){
                    if(value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Your password must contain at least 8 to 16 characters, a combination of upper and lowercase letters, and at least one number or symbol.';
                    }
                    return null;
                  },
                  obscureText: true,
                  style: TextStyle(fontSize: fontSize),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:EdgeInsets.symmetric(vertical: width * 0.06,horizontal: height * 0.02),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.02),
                        borderSide: BorderSide(
                          color: Colors.grey[500],
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.02),
                        borderSide: BorderSide(
                          color: Colors.grey[500],
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.02),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      errorStyle: TextStyle(fontSize: height * 0.02),
                      errorMaxLines: 5,
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.02),
                        borderSide: BorderSide(
                          color: Colors.grey[500],
                          width: 2.0,
                        ),
                      ),
                  ),
                ),
                SizedBox(height: height * 0.04,),
                Center(
                  child: ElevatedButton(
                    child: Text('LOG IN'),
                    style: ElevatedButton.styleFrom(
                      primary: theme['secondary'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.12, vertical: height * 0.025),
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      ),
                    ),
                    onPressed: (){
                      if(_formKey.currentState.validate()) {
                          String username = _usernameController.value.text;
                          String password = _passwordController.value.text;
                          Map<String,dynamic> data = {
                            'username':username,
                            'password':password
                          };
                          onSubmit(data);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


