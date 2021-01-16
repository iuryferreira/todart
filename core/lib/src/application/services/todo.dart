import '../../shared/services/todo.dart';
import '../../shared/usecases/todo.dart';
import '../../shared/dtos/todo.dart';

class TodoService implements ITodoService {
  ITodoUseCase usecase;

  TodoService(this.usecase);

  add(TodoDto data) async {
    return await usecase.add(data);
  }
}
