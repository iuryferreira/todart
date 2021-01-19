import 'package:uuid/uuid.dart';

import '../../interfaces.dart';

class Todo {
  String id;
  String name;
  String userId;

  Todo(this.name, this.id, this.userId);

  static Todo create(String name, String userId) {
    return new Todo(name, Uuid().v4(), userId);
  }

  TodoDto toDto() {
    var data = new TodoDto(this.id, this.name, this.userId);
    return data;
  }
}
