import '../repositories/todo.dart';
import '../presenters/todo.dart';
import '../dtos/todo.dart';
import '../usecase.dart';

abstract class ICreateTodoUseCase extends UseCase<TodoDto> {
  ITodoPresenter presenter;
  ITodoRepository repository;
}
