import 'package:hashio/hashio.dart';
import 'package:todart_core/core.dart';
import 'package:todart_core/src/authentication/auth.dart';

import '../../shared/repositories/user.dart';
import '../../shared/usecases/auth.dart';
import '../../shared/dtos/auth.dart';

class AuthUseCase implements IAuthUseCase {
  IUserRepository repository;

  AuthUseCase(this.repository);

  Future<AuthDto> authenticate(AuthDto data) async {
    var auth = data;
    if (auth.isValid()) {
      var user = await repository.find(username: data.username);
      if (user != null && Hashio.verify(auth.password, user.password)) {
        auth.token =
            Authentication.generate({'username': auth.username, 'id': user.id});
        auth.user = user;
      } else {
        var authError = Errors()..type = AuthenticationError;
        authError.errors.add(AuthenticationError('Usuário ou senha incorretos.',
            name: 'Authentication Error'));
        auth.errors = authError;
      }
    }
    return auth;
  }
}
