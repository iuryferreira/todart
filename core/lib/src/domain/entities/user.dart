import 'package:uuid/uuid.dart';
import 'package:hashio/hashio.dart';

import '../../shared/dtos/user.dart';

class User {
  String id;
  String name;
  String username;
  String password;

  User(this.id, this.name, this.username, this.password);

  static User create(String name, String username, String password) {
    return User(Uuid().v4(), name, username, Hashio.hash(password, PBKDF2()));
  }

  UserDto toDto() {
    var data = UserDto(this.id, this.name, this.username, this.password);
    return data;
  }
}
