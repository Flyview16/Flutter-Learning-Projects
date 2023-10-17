void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  print('Task 1 complete');
}

Future task2() async {
  Duration threeseconds = const Duration(seconds: 5);
  String result = '';
  await Future.delayed(threeseconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2data) {
  print('Task 3 complete with $task2data');
}
