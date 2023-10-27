import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy milk '),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy beans')
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

// Add task
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    // Update all listeners
    notifyListeners();
  }

// Check task
  void updateTask(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

// Delete task
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
