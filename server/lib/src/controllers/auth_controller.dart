import 'package:angel_framework/angel_framework.dart';
import 'package:todart_core/core.dart';

class AuthController {
  IAuthService service;

  AuthController(this.service);

  login(RequestContext request, ResponseContext response) async {
    var data = AuthDto();
    data.username = request.bodyAsMap['username'];
    data.password = request.bodyAsMap['password'];
    var result = await service.login(data);

    if (!result.errors.empty) {
      switch (result.errors.type) {
        case AuthenticationError:
          {
            response.statusCode = 401;
            break;
          }
        case ValidationError:
          {
            response.statusCode = 400;
            break;
          }
        case InternalError:
          {
            response.statusCode = 500;
            break;
          }
      }
      return result.errors;
    }
    response.statusCode = 200;
    return result;
  }
}
