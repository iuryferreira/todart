import '../usecases/todo.dart';
import '../dtos/todo.dart';

abstract class ITodoService {
  ICreateTodoUseCase createTodoUseCase;
  Future<List<TodoDto>> add(TodoDto data);
}
