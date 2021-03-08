import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';

class ContainerAppBar {
  static AppBar appBar({
    @required String title,
    @required bool isToggle,
    @required ValueChanged onSwitch,
    @required VoidCallback iconPress,
    @required double fontSize
  }) {
    return AppBar(
      centerTitle: true,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          title,
          style: TextStyle(color: theme['secondary'],fontSize: fontSize),
        ),
      ),
      actions: [
        Switch(
          value: isToggle,
          onChanged: (value) => onSwitch(value),
          inactiveThumbColor: theme['secondary'],
          inactiveTrackColor: theme['opacitySecondary'],
          activeTrackColor: theme['secondary'],
          activeColor: theme['secondary'],
        ),
      ],
      leading: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          Icons.help,
          color: theme['secondary'],
        ),
        onPressed: iconPress,
      ),
    );
  }
}