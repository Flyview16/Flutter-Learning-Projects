import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {required this.colour,
      this.cardchild,
      this.onPress}); //required - colour property must be given for every call of the Reusable class.s

  final Color colour;
  final Widget?
      cardchild; //Widget? allows to create instances of ReusableCard with or without cardchild. If not provided, cardchild is set to null.
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as void
          Function()?, //Cast to the correct function type which is void.
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardchild,
      ),
    );
  }
}
