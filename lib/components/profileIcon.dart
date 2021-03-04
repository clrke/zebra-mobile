import 'package:flutter/material.dart';

import '../constants/theme.dart';

class ProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: Icon(
        Icons.person_sharp,
        color: theme['secondary'],
        size: 40.0,
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
