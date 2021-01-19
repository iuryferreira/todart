import '../repository.dart';
import '../dtos/todo.dart';

abstract class ITodoRepository extends IRepository {
  Future<bool> add(TodoDto entity);
  Future<TodoDto> update(TodoDto entity);
  Future<TodoDto> find(String id, String userId);
  Future<bool> todoExists(String id, String userId);
}
