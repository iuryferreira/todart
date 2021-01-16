import '../../shared/services/todo.dart';
import '../../shared/usecases/todo.dart';
import '../../shared/dtos/todo.dart';

class TodoService implements ITodoService {
  ICreateTodoUseCase createTodoUseCase;

  TodoService(ICreateTodoUseCase this.createTodoUseCase);

  add(TodoDto data) async {
    await createTodoUseCase.execute(data);
    return createTodoUseCase.presenter.result;
  }
}
