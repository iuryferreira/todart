import '../shared/usecase.dart';
import '../shared/dtos/todo.dart';

abstract class ITodoService {
  UseCase<TodoDto> createTodoUseCase;
  Future<List<TodoDto>> add(TodoDto data);
}

class TodoService implements ITodoService {
  UseCase<TodoDto> createTodoUseCase;

  TodoService(UseCase<TodoDto> createTodoUseCase);

  add(TodoDto data) async {
    await createTodoUseCase.execute(data);
    return createTodoUseCase.presenter.result;
  }
}
