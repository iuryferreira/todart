import 'errors/error.dart';

class Validator {
  static bool isRequired(field, String fieldName, List<Error> errors) {
    if (field == null) {
      errors.add(new Error(fieldName, "Este campo é obrigatório."));
      return false;
    }
    return true;
  }
}
