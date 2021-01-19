import '../repository.dart';
import '../dtos/user.dart';

abstract class IUserRepository extends IRepository {
  Future<bool> add(UserDto entity);
  Future<UserDto> find(String id);
  Future<bool> usernameExists(String username);
}
