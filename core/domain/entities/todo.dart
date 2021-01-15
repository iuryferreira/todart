import 'package:uuid/uuid.dart';

import 'todo_item.dart';

class Todo {
  String id;
  String name;
  List<TodoItem> items;

  Todo(String name, [String id, List<TodoItem> items]) {
    this.name = name;
    this.id = id;
    this.items = items;
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'items': items};
  }

  static Todo create(String name) {
    return new Todo(name, Uuid().v4());
  }

  void addItem(TodoItem item) {
    items.add(item);
  }
}
