import 'errors/error.dart';

abstract class Dto {
  List<Error> errors;
  bool isValid();
}
