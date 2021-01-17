import 'package:ioco/ioco.dart';
import 'package:todart_core/src/domain/usecases/user.dart';
import 'package:todart_core/src/shared/usecases/user.dart';

import '../shared/usecases/todo.dart';
import 'usecases/todo.dart';

void registerDomain(Ioco container) {
  container.bind(ITodoUseCase, TodoUseCase);
  container.bind(IUserUseCase, UserUseCase);
}
