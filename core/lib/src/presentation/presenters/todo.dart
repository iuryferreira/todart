import '../../shared/presenters/todo.dart';
import '../../shared/dtos/todo.dart';

class TodoPresenter implements ITodoPresenter {
  List<TodoDto> result;

  TodoPresenter() {
    result = <TodoDto>[];
  }
  add(TodoDto data) {
    this.result.add(data);
  }
}
