import '../../shared/services/todo.dart';
import '../../shared/usecases/todo.dart';
import '../../shared/dtos/todo.dart';

class TodoService implements ITodoService {
  ICreateTodoUseCase createTodoUseCase;

  TodoService(this.createTodoUseCase);

  add(TodoDto data) async {
    return await createTodoUseCase.execute(data);
  }
}
