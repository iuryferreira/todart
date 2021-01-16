import 'package:angel_framework/angel_framework.dart';
import 'package:todart_core/core.dart';

import 'middlewares/deserialize.dart';
import 'controllers/todo_controller.dart';

routesTodo(Angel app) {
  app.post(
      '/todos',
      (request, response) async =>
          await container.make(TodoController).store(request, response),
      middleware: [deserialize]);
}
