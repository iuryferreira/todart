import 'errors.dart';

abstract class Dto {
  Errors errors;
  bool isValid();
  Map<String, dynamic> toMap();
  Map<String, dynamic> toJson();
}
