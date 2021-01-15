import '../../shared/database.dart';
import '../../shared/repository.dart';
import '../../domain/entities/todo.dart';

class TodoRepository implements IRepository<Todo> {
  @override
  IDatabase connection;

  TodoRepository(IDatabase connection);

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
