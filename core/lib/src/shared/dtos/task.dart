import '../validator.dart';
import '../errors.dart';
import '../dto.dart';

class TaskDto implements Dto {
  String id;
  String message;
  String todoId;
  String userId;
  bool status;

  Errors errors;

  TaskDto([this.id, this.message, this.status, this.todoId]) {
    this.errors = Errors();
  }

  bool isValid() {
    var message = Validator.isRequired(this.message, 'message', errors);
    var todoId = Validator.isRequired(this.todoId, 'todoId', errors);
    return message && todoId;
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'message': message};
  }

  Map<String, dynamic> toJson() => {'id': id, 'message': message};
}
