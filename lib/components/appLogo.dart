import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Image.asset(
      'assets/images/bdi_logo.jpg',
       width: width * 0.55,
    );
  }
}
