import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class AppButtonOutline extends StatelessWidget {
  final Function onPressed;
  final String text;
  final EdgeInsets padding;

  AppButtonOutline({
    @required this.onPressed,
    @required this.text,
    @required this.padding
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    final fontSize = height * 0.025;

    return ElevatedButton(
      child: Text(text,
        style: TextStyle(
        color: theme['secondary'],
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.10),
          side: BorderSide(color: theme['secondary']),
        ),
        padding: padding,
        textStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
