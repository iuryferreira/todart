import '../../../core.dart';
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
}
