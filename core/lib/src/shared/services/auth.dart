import '../usecases/auth.dart';
import '../dtos/auth.dart';

abstract class IAuthService {
  IAuthUseCase usecase;
  Future<AuthDto> login(AuthDto data);
}
