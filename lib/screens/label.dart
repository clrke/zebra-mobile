import 'package:flutter/material.dart';
import 'package:zero_mobile/components/appCustomPainter/labelAndVote.dart';

class Label extends StatefulWidget {

  final String imageSource;

  Label({
    @required this.imageSource,
  });

  @override
  _LabelState createState() => _LabelState(imageSource: imageSource);
}

class _LabelState extends State<Label> {
  String imageSource;

  _LabelState({
    @required this.imageSource,
  });

  @override
  Widget build(BuildContext context) {
    return LabelAndVote(imageSource: imageSource,);
  }
}
