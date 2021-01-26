abstract class CustomError {
  String message;
  Map<String, dynamic> toJson() => {'message': message};
}

class InternalError implements CustomError {
  String name;
  String message;

  InternalError(this.message, {this.name = 'Internal Error'});

  Map<String, dynamic> toJson() => {'name': name, 'message': message};
}

class AuthenticationError implements CustomError {
  String name;
  String message;

  AuthenticationError(this.message, {this.name = 'Authentication Error'});

  Map<String, dynamic> toJson() => {'name': name, 'message': message};
}

class ValidationError implements CustomError {
  String message;
  String field;

  ValidationError(this.field, this.message);

  Map<String, dynamic> toJson() => {'field': field, 'message': message};
}

class Errors {
  List<CustomError> errors;
  Type type;
  bool get empty => errors.isEmpty;

  Errors() {
    errors = <CustomError>[];
  }
  Map<String, dynamic> toJson() => {'type': type.toString(), 'errors': errors};
}
