import 'package:ioco/ioco.dart';
import '../shared/services/todo.dart';
import '../shared/services/user.dart';
import 'services/todo.dart';
import 'services/user.dart';

void registerApplication(Ioco container) {
  container.bind(ITodoService, TodoService);
  container.bind(IUserService, UserService);
}
