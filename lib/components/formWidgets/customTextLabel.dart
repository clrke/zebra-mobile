import 'package:flutter/material.dart';

class CustomTextLabel extends StatelessWidget {

  final String labelText;

  CustomTextLabel({this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
      child: Text(
        labelText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
