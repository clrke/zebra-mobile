import 'package:flutter/material.dart';
import 'package:zero_mobile/components/appLabelVote/labelAndVote.dart';

class Label extends StatefulWidget {
  final String imageSource;

  Label({
    this.imageSource,
  });

  @override
  _LabelState createState() => _LabelState(imageSource: imageSource);
}

class _LabelState extends State<Label> {

  String imageSource;

  _LabelState({
    this.imageSource,
  });

  @override
  Widget build(BuildContext context) {
    return LabelAndVote(imageSource: imageSource);
  }
}
