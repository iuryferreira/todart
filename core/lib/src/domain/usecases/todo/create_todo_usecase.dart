import '../../../shared/repositories/todo.dart';
import '../../../shared/usecases/todo.dart';
import '../../../shared/dtos/todo.dart';
import '../../entities/todo.dart';

class CreateTodoUseCase implements ICreateTodoUseCase {
  ITodoRepository repository;

  CreateTodoUseCase(this.repository);

  execute(TodoDto data) async {
    var todo = data;

    if (todo.isValid()) {
      var entity = Todo.create(todo.name);
      todo = new TodoDto(entity.id, entity.name, entity.items);
      await this.repository.add(todo);
    }
    return todo;
  }
}
