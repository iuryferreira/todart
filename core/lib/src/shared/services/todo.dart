import '../usecases/todo.dart';
import '../dtos/todo.dart';

abstract class ITodoService {
  ICreateTodoUseCase createTodoUseCase;
  Future<TodoDto> add(TodoDto data);
}
