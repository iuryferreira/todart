import 'package:todart_core/core.dart';

import '../errors.dart';
import '../dto.dart';
import '../validator.dart';

class AuthDto implements Dto {
  String username;
  String password;
  String token;
  UserDto user;

  Errors errors;

  AuthDto([this.username, this.password, this.token]) {
    this.errors = Errors();
  }

  AuthDto.fromMap(Map<String, dynamic> map)
      : username = map['id'],
        password = map['name'];

  bool isValid() {
    var username = Validator.isRequired(this.username, 'username', errors);
    var password = Validator.isRequired(this.password, 'password', errors);
    return username && password;
  }

  Map<String, dynamic> toJson() =>
      {'username': username, 'token': token, 'user': user};

  Map<String, dynamic> toMap() =>
      {'username': username, 'token': token, 'user': user};
}
