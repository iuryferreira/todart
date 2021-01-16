import 'errors.dart';

abstract class Dto {
  Errors errors;
  bool isValid();
}
