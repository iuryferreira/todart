import '../../shared/services/user.dart';
import '../../shared/usecases/user.dart';
import '../../shared/dtos/user.dart';

class UserService implements IUserService {
  IUserUseCase usecase;

  UserService(this.usecase);

  add(UserDto data) async {
    return await usecase.add(data);
  }
}
