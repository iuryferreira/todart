import '../repositories/todo.dart';
import '../dtos/todo.dart';
import '../usecase.dart';

abstract class ICreateTodoUseCase extends UseCase<TodoDto> {
  ITodoRepository repository;
}
