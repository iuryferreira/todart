import '../../../core.dart';
import '../../shared/database.dart';
import '../../shared/repositories/user.dart';

class UserRepository implements IUserRepository {
  IDatabase connection;
  Errors errors;

  UserRepository(this.connection) {
    this.errors = Errors();
    errors.type = InternalError;
  }

  add(entity) async {
    try {
      await connection.firestore
          .collection('users')
          .document(entity.id)
          .create(entity.toMap());
      return true;
    } catch (err) {
      errors.errors.add(InternalError(err));
      return false;
    }
  }

  usernameExists(username) async {
    try {
      var users = await connection.firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();
      if (users.isNotEmpty) {
        errors.type = ValidationError;
        errors.errors.add(ValidationError(
            'username', "Este nome de usuário não está disponível."));
        return true;
      }
      return false;
    } catch (err) {
      errors.errors.add(InternalError(err));
      return true;
    }
  }

  find(id) async {
    try {
      var result = (await connection.firestore
              .collection('users')
              .where('id', isEqualTo: id)
              .get())
          .first;

      var user = UserDto.fromMap(result.map);
      return user;
    } catch (err) {
      if (err is StateError) {
        errors.type = ValidationError;
        errors.errors
            .add(ValidationError('userId', "Este usuário não existe."));
        return null;
      }
      errors.errors.add(InternalError(err.message));
      return null;
    }
  }
}
