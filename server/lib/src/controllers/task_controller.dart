import 'package:angel_framework/angel_framework.dart';
import 'package:todart_core/core.dart';

class TaskController {
  ITaskService service;

  TaskController(this.service);

  store(RequestContext request, ResponseContext response) async {
    var data = TaskDto();
    data.message = request.bodyAsMap['message'];
    data.userId = request.bodyAsMap['userId'];
    data.todoId = request.bodyAsMap['todoId'];
    var result = await service.add(data);

    if (!result.errors.empty) {
      result.errors.type == ValidationError
          ? response.statusCode = 400
          : response.statusCode = 500;
      return result.errors;
    }
    response.statusCode = 201;
    return result;
  }
}
