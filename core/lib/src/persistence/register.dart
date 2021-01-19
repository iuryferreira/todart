import 'package:ioco/ioco.dart';

import '../shared/repositories/todo.dart';
import '../shared/repositories/user.dart';
import '../shared/database.dart';
import 'repositories/todo.dart';
import 'repositories/user.dart';
import 'database.dart';

void registerPersistence(Ioco container) {
  container.singleton(Database(), as: IDatabase);
  container.bind(ITodoRepository, TodoRepository);
  container.bind(IUserRepository, UserRepository);
}
