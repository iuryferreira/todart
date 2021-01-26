import '../../shared/services/auth.dart';
import '../../shared/usecases/auth.dart';
import '../../shared/dtos/auth.dart';

class AuthService implements IAuthService {
  IAuthUseCase usecase;

  AuthService(this.usecase);

  login(AuthDto data) async {
    return await usecase.authenticate(data);
  }
}
