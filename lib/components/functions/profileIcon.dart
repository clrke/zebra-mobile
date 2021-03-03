import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: Icon(
        Icons.person_sharp,
        color: Colors.redAccent,
        size: 40.0,
      ),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        border: new Border.all(
          color: Colors.red,
          width: 2.0,
        ),
      ),

    );
  }
}
