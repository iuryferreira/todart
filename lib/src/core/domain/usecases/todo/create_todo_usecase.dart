import '../../../shared/usecase.dart';
import '../../../shared/dtos/todo.dart';
import '../../../shared/presenter.dart';
import '../../../shared/repository.dart';

import '../../entities/todo.dart';

class CreateTodoUseCase implements UseCase<TodoDto> {
  IPresenter<TodoDto> presenter;
  IRepository<TodoDto> repository;

  CreateTodoUseCase(
      IRepository<TodoDto> this.repository, IPresenter<TodoDto> this.presenter);

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
