import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: ((context, index) {
            final task = taskdata.tasks[index];
            return TasksTile(
              taskTitle: task.name,
              checkValue: task.isDone,
              checkBoxCallback: (checkboxState) {
                taskdata.updateTask(task);
              },
              longpressCallback: () {
                taskdata.deleteTask(task);
              },
            );
          }),
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
