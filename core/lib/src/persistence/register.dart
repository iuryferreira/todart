import 'package:ioco/ioco.dart';

import '../shared/repositories/todo.dart';
import '../shared/database.dart';
import 'repositories/todo.dart';
import 'database.dart';

void registerPersistence(Ioco container) {
  container.singleton(new Database(), as: IDatabase);
  container.bind(ITodoRepository, TodoRepository);
}
