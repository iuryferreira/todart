import 'package:angel_framework/angel_framework.dart';
import 'package:todart_core/core.dart';

class UserController {
  IUserService service;

  UserController(this.service);

  store(RequestContext request, ResponseContext response) async {
    var data = new UserDto();
    data.name = request.bodyAsMap['name'];
    data.username = request.bodyAsMap['username'];
    data.password = request.bodyAsMap['password'];

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
