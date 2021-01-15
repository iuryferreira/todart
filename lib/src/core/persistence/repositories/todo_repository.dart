import '../../shared/database.dart';
import '../../shared/repository.dart';
import '../../shared/dtos/todo.dart';

class TodoRepository implements IRepository<TodoDto> {
  @override
  IDatabase connection;

  TodoRepository(IDatabase this.connection);

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
