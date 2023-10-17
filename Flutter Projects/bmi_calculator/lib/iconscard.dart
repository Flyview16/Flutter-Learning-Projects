import 'package:flutter/material.dart';
import 'constants.dart';

class IconsCard extends StatelessWidget {
  const IconsCard({this.icon, this.label = ''});

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
        const SizedBox(
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
