<<<<<<< HEAD
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
=======
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
>>>>>>> ef6dedb71b31e867bd3c2fd2fa8e6ad7d5f125bb

import 'package:flutter/material.dart';
import 'constants.dart';

class IconsCard extends StatelessWidget {
  IconsCard({this.icon, this.label = ''});

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
