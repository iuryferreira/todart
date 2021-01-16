import '../repositories/todo.dart';
import '../../../core.dart';

abstract class ITodoUseCase {
  ITodoRepository repository;
  Future<TodoDto> add(TodoDto data);
}
