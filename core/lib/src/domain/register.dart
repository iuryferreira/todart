import 'package:ioco/ioco.dart';

import '../shared/usecases/todo.dart';
import 'usecases/todo.dart';

void registerDomain(Ioco container) {
  container.bind(ITodoUseCase, TodoUseCase);
}
