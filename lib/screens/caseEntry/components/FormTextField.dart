import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class FormTextField extends StatelessWidget {
  final controller;
  final Function(String) onValidate;
  final String hintText;
  final bool obscureText;
  final double widthSize;
  final double paddingVertical;
  final double paddingHorizontal;
  final String labelText;

  FormTextField({
    @required this.controller,
    @required this.onValidate,
    @required this.hintText,
    @required this.obscureText,
    @required this.widthSize,
    @required this.paddingHorizontal,
    @required this.paddingVertical,
    @required this.labelText
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    final fontSize = height * 0.02;
    final borderRadius = height * 0.025;

    return Container(
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: onValidate,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText,
          labelStyle: TextStyle(fontSize: height * 0.023,color: theme['primary']),
          contentPadding:EdgeInsets.symmetric(
              vertical: paddingHorizontal,
              horizontal: paddingVertical
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
      ),
    );
  }
}
