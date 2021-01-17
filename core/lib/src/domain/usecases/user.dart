import '../../shared/repositories/user.dart';
import '../../shared/usecases/user.dart';
import '../../shared/dtos/user.dart';
import '../entities/user.dart';

class UserUseCase implements IUserUseCase {
  IUserRepository repository;

  UserUseCase(this.repository);

  add(UserDto data) async {
    var user = data;

    if (user.isValid()) {
      var entity = User.create(user.name, user.username, user.password);
      if (!await this.repository.exists(entity.username)) {
        user = entity.cast();
        if (!await this.repository.add(user)) {
          data.errors = repository.errors;
        }
      }
      data.errors = repository.errors;
    }
    return user;
  }
}
