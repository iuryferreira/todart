import 'package:ioco/ioco.dart';
import '../shared/services/todo.dart';
import 'services/todo.dart';

void registerApplication(Ioco container) {
  container.bind(ITodoService, TodoService);
}
