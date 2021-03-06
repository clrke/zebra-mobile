import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class AppTextField extends StatelessWidget {
  final controller;
  final Function(String) onValidate;
  final String hintText;
  final bool obscureText;
  final double widthSize;
  final double paddingVertical;
  final double paddingHorizontal;

  AppTextField({
    @required this.controller,
    @required this.onValidate,
    @required this.hintText,
    @required this.obscureText,
    @required this.widthSize,
    @required this.paddingHorizontal,
    @required this.paddingVertical,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    final fontSize = height * 0.02;
    final borderRadius = height * 0.025;

    return Container(
      width: widthSize,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: onValidate,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:EdgeInsets.symmetric(
              vertical: paddingHorizontal,
              horizontal: paddingVertical
          ),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: theme['secondary'],
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: theme['secondary'],
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: theme['secondary'],
              width: 2.0,
            ),
          ),
          errorStyle: TextStyle(fontSize: height * 0.02),
          errorMaxLines: 5,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: theme['secondary'],
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
