import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dotenv/dotenv.dart';

class Authentication {
  static String generate(payload) {
    final jwt = JWT(payload);
    var token = jwt.sign(SecretKey(env['JWT_SECRET']));
    return token;
  }

  static bool verify(String token) {
    try {
      JWT.verify(token, SecretKey(env['JWT_SECRET']));
      return true;
    } on JWTInvalidError {
      return false;
    }
  }
}
