import 'package:ioco/ioco.dart';
import '../shared/services/todo.dart';
import '../shared/services/user.dart';
import '../shared/services/task.dart';
import '../shared/services/auth.dart';

import 'services/todo.dart';
import 'services/user.dart';
import 'services/task.dart';
import 'services/auth.dart';

void registerApplication(Ioco container) {
  container.bind(ITodoService, TodoService);
  container.bind(IUserService, UserService);
  container.bind(ITaskService, TaskService);
  container.bind(IAuthService, AuthService);
}
