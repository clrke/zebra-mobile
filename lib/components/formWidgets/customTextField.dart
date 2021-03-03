import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;
  final bool obscureText;

  CustomTextField({this.hintText, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'This is required.';
        }
        return null;
      },

      obscureText: obscureText,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 16.0,
        ),
        hintText: hintText,
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

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),

      ),
    );
  }
}
