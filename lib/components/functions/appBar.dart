import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';

class ContainerAppBar {
  static AppBar appBar({
    @required String title,
    @required bool isToggle,
    @required ValueChanged onSwitch,
    @required VoidCallback iconPress
  }) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: theme['primary']),
      ),
      actions: [
        Switch(
          value: isToggle,
          onChanged: (value) => onSwitch(value),
          inactiveThumbColor: theme['primary'],
          inactiveTrackColor: theme['secondary'],
          activeTrackColor: theme['primary'],
        ),
      ],
      leading: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          Icons.help,
          color: theme['primary'],
        ),
        onPressed: iconPress,
      ),
    );
  }
}