import '../repository.dart';
import '../dtos/todo.dart';

abstract class ITodoRepository extends IRepository {
  Future<bool> add(TodoDto entity);
  Future<TodoDto> find(String id);
  Future<bool> todoExists(String username);
}
