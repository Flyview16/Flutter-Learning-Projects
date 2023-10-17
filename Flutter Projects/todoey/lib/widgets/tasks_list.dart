import 'package:flutter/material.dart';
import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.checkValue,
  });

  final bool checkValue;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TasksTile(checkValue: checkValue),
        TasksTile(checkValue: checkValue),
        TasksTile(checkValue: checkValue),
      ],
    );
  }
}