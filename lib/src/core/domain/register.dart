import 'package:ioco/ioco.dart';

import 'usecases/todo/create_todo_usecase.dart';
import '../shared/usecases/todo.dart';

void registerDomain(Ioco container) {
  container.bind(ICreateTodoUseCase, CreateTodoUseCase);
}
