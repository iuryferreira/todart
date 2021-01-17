import '../repository.dart';
import '../dtos/todo.dart';

abstract class ITodoRepository extends IRepository {
  Future<bool> add(TodoDto entity);
}
