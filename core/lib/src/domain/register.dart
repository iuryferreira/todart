import 'package:ioco/ioco.dart';

import '../shared/usecases/todo.dart';
import '../shared/usecases/user.dart';
import '../shared/usecases/task.dart';

import 'usecases/user.dart';
import 'usecases/todo.dart';
import 'usecases/task.dart';

void registerDomain(Ioco container) {
  container.bind(ITodoUseCase, TodoUseCase);
  container.bind(IUserUseCase, UserUseCase);
  container.bind(ITaskUseCase, TaskUseCase);
}
