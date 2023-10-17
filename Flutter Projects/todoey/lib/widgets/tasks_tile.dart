import 'package:flutter/material.dart' ;

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
      trailing: Checkbox(
        value: checkValue,
        onChanged: (newValue) {},
      ),
    );
  }
}
