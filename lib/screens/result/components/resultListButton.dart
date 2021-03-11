import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class ResultListButton extends StatelessWidget {
  final String buttonLabel;
  final double elevationValue;
  final EdgeInsets padding;
  final String vote;

  ResultListButton({
    @required this.buttonLabel,
    @required this.elevationValue,
    @required this.padding,
    this.vote
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Color themeColor;
    final height = SizeConfig.screenHeight;

    if(vote != null) {
      if(vote == 'y') {
        themeColor = theme['primary'];
      } else {
        themeColor = theme['secondary'];
      }
    } else {
      themeColor = theme['secondary'];
    }

    return Container(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: ElevatedButton(
          child: Text('$buttonLabel'),
          style: ElevatedButton.styleFrom(
            elevation: elevationValue,
            primary: themeColor,
            padding: padding,
            textStyle: TextStyle(
                fontSize: height * 0.018,
                fontWeight: FontWeight.bold
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
