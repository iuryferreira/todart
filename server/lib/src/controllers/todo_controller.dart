import 'package:angel_framework/angel_framework.dart';
import 'package:todart_core/core.dart';

class TodoController {
  ITodoService service;

  TodoController(this.service);

  store(RequestContext request, ResponseContext response) async {
    var data = TodoDto();
    data.name = request.bodyAsMap['name'];
    data.userId = request.bodyAsMap['userId'];
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
