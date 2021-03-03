import 'package:flutter/material.dart';

class CustomPostField extends StatelessWidget {

  final String hintText;

  CustomPostField({this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'This is required.';
        }
        return null;
      },
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 16.0,
        ),
        hintText: hintText,
        fillColor: Colors.grey[300],
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey[300],
            width: 1.0,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 2.0,
          ),
        ),

      ),
    );
  }
}
