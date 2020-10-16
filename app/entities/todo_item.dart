import 'package:uuid/uuid.dart';

class TodoItem {
  String id;
  String title;
  String task;

  TodoItem(String title, String task) {
    this.id = Uuid().v4();
    this.title = title;
    this.task = task;
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'task': task,
      };
}
