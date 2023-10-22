import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  const TasksTile({
    super.key,
    required this.checkValue,
  });

  final bool checkValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('This is a task'),
      trailing: TaskCheckbox(),
    );
  }
}

class TaskCheckbox extends StatefulWidget {
  @override
  State<TaskCheckbox> createState() => _TaskCheckboxState();
}

class _TaskCheckboxState extends State<TaskCheckbox> {
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.deepPurple,
      value: checkValue,
      onChanged: (newValue) {
        setState(() {
          checkValue = newValue!; //Null check
        });
      },
    );
  }
}
