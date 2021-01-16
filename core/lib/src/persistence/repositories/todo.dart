import '../../shared/database.dart';
import '../../shared/repositories/todo.dart';

class TodoRepository implements ITodoRepository {
  IDatabase connection;

  TodoRepository(this.connection);

  add(entity) async {
    try {
      await connection.firestore
          .collection('todos')
          .document(entity.id)
          .create(entity.toMap());
      return true;
    } catch (err) {
      throw err;
    }
  }
}
