import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.onTap, required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20.0),
        width: 400.0, //remember to fix this error
        height: bottomContainerheight,
        color: bottomContainercolor,
        margin: const EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: largeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
