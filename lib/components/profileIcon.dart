import 'package:flutter/material.dart';
import '../constants/theme.dart';

class ProfileIcon extends StatelessWidget {

  final double size;

  ProfileIcon({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.person_sharp,
        color: theme['secondary'],
        size: size,
      ),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        border: new Border.all(
          color: theme['secondary'],
          width: 1.5,
        ),
      ),

    );
  }
}
