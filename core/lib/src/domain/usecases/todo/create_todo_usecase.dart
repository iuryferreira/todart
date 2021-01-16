import '../../../shared/repositories/todo.dart';
import '../../../shared/presenters/todo.dart';
import '../../../shared/usecases/todo.dart';
import '../../../shared/dtos/todo.dart';
import '../../entities/todo.dart';

class CreateTodoUseCase implements ICreateTodoUseCase {
  ITodoPresenter presenter;
  ITodoRepository repository;

  CreateTodoUseCase(
      ITodoRepository this.repository, ITodoPresenter this.presenter);

  @override
  execute(TodoDto data) async {
    if (!data.isValid()) {
      return false;
    }
    var todo = Todo.create(data.name);

    var todoData = new TodoDto(todo.id, todo.name, todo.items);

    if (!(await this.repository.add(todoData))) {
      return false;
    }
    this.presenter.add(todoData);
    return true;
  }
}
