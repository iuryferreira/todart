import '../usecases/user.dart';
import '../dtos/user.dart';

abstract class IUserService {
  IUserUseCase usecase;
  Future<UserDto> add(UserDto data);
}
