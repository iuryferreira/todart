import 'package:angel_framework/angel_framework.dart';
import 'package:todart_core/core.dart';

import 'controllers/user_controller.dart';
import 'controllers/todo_controller.dart';
import 'middlewares/deserialize.dart';

routesTodo(Angel app) {
  app.post(
      '/todos',
      (request, response) async =>
          await container.make(TodoController).store(request, response),
      middleware: [deserialize]);
  app.post(
      '/users',
      (request, response) async =>
          await container.make(UserController).store(request, response),
      middleware: [deserialize]);
}
