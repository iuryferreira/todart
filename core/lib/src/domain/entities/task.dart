import 'package:todart_core/src/shared/dtos/task.dart';
import 'package:uuid/uuid.dart';

class Task {
  String id;
  String message;
  bool status;
  String todoId;

  Task(this.id, this.message, this.status, this.todoId);

  static Task create(String message, String todoId) {
    return Task(Uuid().v4(), message, false, todoId);
  }

  TaskDto toDto() {
    var data = TaskDto(this.id, this.message, this.status, this.todoId);
    return data;
  }
}
