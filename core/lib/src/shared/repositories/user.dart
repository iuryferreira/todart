import '../repository.dart';
import '../dtos/user.dart';

abstract class IUserRepository extends IRepository {
  Future<bool> add(UserDto entity);
  Future<bool> exists(String username);
}
