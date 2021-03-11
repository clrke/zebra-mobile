import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class VotePercentage extends StatelessWidget {
  final double yesPercentage;
  final double noPercentage;
  final double progressValue;

  VotePercentage({
    @required this.progressValue,
    @required this.yesPercentage,
    @required this.noPercentage
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;

    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(200),
                    ),
                    color: theme['primary'],
                  ),
                  child: Text(
                    '$yesPercentage%',
                    style: TextStyle(
                        fontSize: height * 0.016,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  width: width * 0.50,
                  height: 10,
                  child: LinearProgressIndicator(
                    backgroundColor:
                    theme['opacitySecondary'],
                    value: progressValue,
                    valueColor: AlwaysStoppedAnimation(
                        theme['secondary']),
                    semanticsLabel:
                    'Linear progress indicator',
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(200),
                    ),
                    color: theme['primary'],
                  ),
                  child: Text(
                    '$noPercentage%',
                    style: TextStyle(
                        fontSize: height * 0.016,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
