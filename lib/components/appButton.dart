import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final EdgeInsets padding;
  final double elevation;

  AppButton({
    @required this.onPressed,
    @required this.text,
    @required this.padding,
    this.elevation
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    final fontSize = height * 0.025;

    return ElevatedButton(
      child: Text(text),
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        primary: theme['secondary'],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.10),
        ),
        padding: padding,
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
