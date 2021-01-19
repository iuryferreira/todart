import '../../shared/dtos/todo.dart';
import '../../shared/errors.dart';
import '../../shared/database.dart';
import '../../shared/repositories/todo.dart';

class TodoRepository implements ITodoRepository {
  IDatabase connection;
  Errors errors;

  TodoRepository(this.connection) {
    this.errors = Errors();
    this.errors.type = InternalError;
  }

  add(entity) async {
    try {
      var user = (await connection.firestore
              .collection('users')
              .document(entity.userId)
              .get())
          .map;

      var todos = List.from(user['todos']);
      todos.add(entity.toMap());

      await connection.firestore
          .collection('users')
          .document(entity.userId)
          .update({'todos': todos});
      return true;
    } catch (err) {
      errors.errors.add(InternalError(err.message));
      return false;
    }
  }

  find(id, userId) async {
    try {
      var user = (await connection.firestore
              .collection('users')
              .document(userId)
              .get())
          .map;
      var todos = List.from(user['todos']);
      for (var todo in todos) {
        if (todo['id'] == id) {
          return TodoDto.fromMap(todo);
        }
      }
      return null;
    } catch (err) {
      if (err is StateError) {
        errors.type = ValidationError;
        errors.errors
            .add(ValidationError('userId', "Este usuário não existe."));
        return null;
      }
      errors.errors.add(InternalError(err.message));
      return null;
    }
  }

  update(entity) async {
    try {
      var user = (await connection.firestore
              .collection('users')
              .document(entity.userId)
              .get())
          .map;

      var todos = List.from(user['todos']);
      var data = entity.toMap();

      for (var todo in todos) {
        if (todo['id'] == entity.id) {
          todos.remove(todo);
          todos.add(data);
        }
      }

      await connection.firestore
          .collection('users')
          .document(entity.userId)
          .update({'todos': todos});
      return entity;
    } catch (err) {
      if (err is StateError) {
        errors.type = ValidationError;
        errors.errors
            .add(ValidationError('userId', "Este usuário não existe."));
        return null;
      }
      errors.errors.add(InternalError(err.message));
      return null;
    }
  }

  todoExists(id, userId) async {
    try {
      var user = (await connection.firestore
              .collection('users')
              .document(userId)
              .get())
          .map;
      var todos = List.from(user['todos']);
      for (var todo in todos) {
        if (todo['id'] == id) {
          return true;
        }
      }
      return false;
    } catch (err) {
      if (err is StateError) {
        errors.type = ValidationError;
        errors.errors
            .add(ValidationError('userId', "Este usuário não existe."));
        return false;
      }
      errors.errors.add(InternalError(err.message));
      return false;
    }
  }
}
