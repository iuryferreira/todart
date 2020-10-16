import 'package:uuid/uuid.dart';

import 'todo_item.dart';

class TodoList {
  String id;
  String title;
  List<TodoItem> items;
  TodoList(String this.title) {
    this.items = new List<TodoItem>();
    id = Uuid().v4();
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'items': items,
      };
}
