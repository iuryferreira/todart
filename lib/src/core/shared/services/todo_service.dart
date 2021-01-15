import '../usecase.dart';
import '../dtos/todo.dart';

abstract class ITodoService {
  UseCase<TodoDto> createTodoUseCase;
  Future<List<TodoDto>> add(TodoDto data);
}
