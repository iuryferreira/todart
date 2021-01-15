import '../../../shared/usecase.dart';
import '../../../shared/dtos/todo.dart';
import '../../../shared/presenter.dart';
import '../../../shared/repository.dart';

import '../../entities/todo.dart';

class CreateTodoUseCase implements UseCase<TodoDto> {
  IPresenter<TodoDto> presenter;
  IRepository<TodoDto> repository;

  CreateTodoUseCase(
      IRepository<TodoDto> repository, IPresenter<TodoDto> presenter);

  @override
  execute(TodoDto data) async {
    if (!data.isValid()) {
      return false;
    }
    var todo = (Todo.create(data.name)) as TodoDto;

    if (!(await this.repository.add(todo))) {
      return false;
    }
    this.presenter.add(todo);
    return true;
  }
}
