import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final bool checkValue;
  final String taskTitle;
  final Function checkBoxCallback;
  final Function? longpressCallback;

  const TasksTile(
      {super.key,
      this.checkValue = false,
      this.taskTitle = '',
      required this.checkBoxCallback,
      this.longpressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        longpressCallback!();
      },
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration:
                checkValue ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
          activeColor: Colors.deepPurple,
          value: checkValue,
          onChanged: (newValue) {
            checkBoxCallback(newValue);
          }),
    );
  }
}
