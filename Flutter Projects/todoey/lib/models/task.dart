class Task {
  final String name;
  bool isDone = false;

  Task({this.name = '', this.isDone = false});

  void toggleIsDone() {
    isDone = !isDone;
  }
}
