import '../repositories/user.dart';
import '../dtos/auth.dart';

abstract class IAuthUseCase {
  IUserRepository repository;
  Future<AuthDto> authenticate(AuthDto data);
}
