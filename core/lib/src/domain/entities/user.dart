import 'package:uuid/uuid.dart';
import 'package:password/password.dart';

import '../../shared/dtos/user.dart';

class User {
  String id;
  String name;
  String username;
  String password;

  User(this.id, this.name, this.username, this.password);

  static User create(String name, String username, String password) {
    return new User(
        Uuid().v4(), name, username, Password.hash(password, PBKDF2()));
  }

  UserDto toDto() {
    var data = new UserDto(this.id, this.name, this.username, this.password);
    return data;
  }
}
