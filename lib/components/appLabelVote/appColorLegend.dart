import 'package:flutter/material.dart';

class AppColorLegend extends StatelessWidget {
  final String anatomicalLandmark;
  final Color color;

  AppColorLegend({
    this.anatomicalLandmark,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 25.0,
            height: 25.0,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0,0,0),
            child: Text(
              '$anatomicalLandmark',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
