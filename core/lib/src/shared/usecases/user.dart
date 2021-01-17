import '../repositories/user.dart';
import '../dtos/user.dart';

abstract class IUserUseCase {
  IUserRepository repository;
  Future<UserDto> add(UserDto data);
}
