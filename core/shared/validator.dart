import 'errors/error.dart';

class Validator {
  static bool isRequired(field, String fieldName, List<Error> errors) {
    if (field ?? false) {
      errors.add(new Error(fieldName, "Este campo é obrigatório."));
      return false;
    }
    return true;
  }
}
