import 'package:ioco/ioco.dart';

import '../shared/repositories/todo.dart';
import '../shared/database.dart';
import 'repositories/todo.dart';
import 'database.dart';

void registerPersistence(Ioco container) {
  container.bind(IDatabase, Database);
  container.bind(ITodoRepository, TodoRepository);
}
