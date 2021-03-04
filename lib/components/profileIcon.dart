import 'package:flutter/material.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

import '../constants/theme.dart';

class ProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;

    return Container(
      child: Icon(
        Icons.person_sharp,
        color: theme['secondary'],
      ),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        border: new Border.all(
          color: theme['secondary'],
          width: 2.0,
        ),
      ),

    );
  }
}
