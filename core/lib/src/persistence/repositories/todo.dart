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
      await connection.firestore
          .collection('todos')
          .document(entity.id)
          .create(entity.toMap());
      return true;
    } catch (err) {
      errors.errors.add(InternalError(err));
      return false;
    }
  }
}
