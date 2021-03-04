import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class AppTextField extends StatelessWidget {
  final controller;
  final Function(String) onValidate;
  final String hintText;
  final bool obscureText;

  AppTextField({
    @required this.controller,
    @required this.onValidate,
    @required this.hintText,
    @required this.obscureText
  });

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    final fontSize = height * 0.025;
    final borderRadius = height * 0.02;

    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: onValidate,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        contentPadding:EdgeInsets.symmetric(
            vertical: width * 0.06,
            horizontal: height * 0.02
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.grey[500],
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.grey[500],
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        errorStyle: TextStyle(fontSize: height * 0.02),
        errorMaxLines: 5,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.grey[500],
            width: 2.0,
          ),
        ),
      ),
    );
  }
}