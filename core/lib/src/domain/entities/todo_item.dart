import 'package:uuid/uuid.dart';

import 'task.dart';

class TodoItem {
  String id;
  String title;
  bool status;
  List<Task> tasks;

  TodoItem(String title, String id, [bool status, List<Task> tasks]) {
    this.title = title;
    this.id = id;
    this.status = status;
    this.tasks = tasks;
  }

  static TodoItem create(String title) {
    return new TodoItem(title, Uuid().v4(), false, []);
  }

  void addTask(String message) {
    tasks.add(Task.create(message));
  }
}
