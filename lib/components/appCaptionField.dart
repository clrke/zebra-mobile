import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class AppCaptionField extends StatelessWidget {
  final controller;
  final Function(String) onValidate;
  final String hintText;

  AppCaptionField({
    @required this.controller,
    this.onValidate,
    @required this.hintText,
  });

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    final fontSize = height * 0.02;
    final borderRadius = height * 0.02;

    return TextFormField(
      autofocus: true,
      maxLines: null,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: onValidate,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        fillColor: Colors.blueGrey.withOpacity(0.5),
        filled: true,
        contentPadding:EdgeInsets.symmetric(
            vertical: width * 0.05,
            horizontal: height * 0.02,
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: fontSize),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.grey[400],
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
