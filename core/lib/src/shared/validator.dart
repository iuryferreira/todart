import 'package:todart_core/src/shared/errors.dart';

class Validator {
  static bool isRequired(field, String fieldName, Errors errorGroup) {
    if (field == null) {
      errorGroup.errors
          .add(ValidationError(fieldName, "Este campo é obrigatório."));
      errorGroup.type = ValidationError;
      return false;
    }
    return true;
  }
}
