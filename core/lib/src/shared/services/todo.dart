import '../usecases/todo.dart';
import '../dtos/todo.dart';

abstract class ITodoService {
  ITodoUseCase usecase;
  Future<TodoDto> add(TodoDto data);
}
