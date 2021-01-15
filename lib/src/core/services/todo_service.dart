import '../shared/services/todo_service.dart';
import '../shared/usecase.dart';
import '../shared/dtos/todo.dart';

class TodoService implements ITodoService {
  UseCase<TodoDto> createTodoUseCase;

  TodoService(UseCase<TodoDto> this.createTodoUseCase);

  add(TodoDto data) async {
    await createTodoUseCase.execute(data);
    return createTodoUseCase.presenter.result;
  }
}
