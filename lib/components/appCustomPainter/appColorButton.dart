import 'package:flutter/material.dart';

class ColorButton extends StatefulWidget {

  final Color color;
  final String semanticLabel;
  final Function onPressed;

  ColorButton({
    @required this.color,
    @required this.semanticLabel,
    @required this.onPressed,
  });

  @override
  _ColorButtonState createState() => _ColorButtonState(color, semanticLabel, onPressed);
}

class _ColorButtonState extends State<ColorButton> {

  bool isSelected = false;

  final Color color;
  final String semanticLabel;
  final Function onPressed;

  _ColorButtonState(this.color, this.semanticLabel, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.circle,
        color: color,
        semanticLabel: semanticLabel,
        size: 40.0,
      ),
      onPressed: onPressed,
    );
  }
}
