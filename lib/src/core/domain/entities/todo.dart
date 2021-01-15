import 'package:uuid/uuid.dart';

import 'todo_item.dart';

class Todo {
  String id;
  String name;
  List<TodoItem> items;

  Todo(this.name, this.id, this.items);

  static Todo create(String name) {
    return new Todo(name, Uuid().v4(), []);
  }

  void addItem(TodoItem item) {
    items.add(item);
  }
}
