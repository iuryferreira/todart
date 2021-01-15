import '../errors/error.dart';
import '../validator.dart';
import 'dto.dart';

class TodoDto implements Dto {
  String id;
  String name;
  List<dynamic> items;

  @override
  List<Error> errors;

  @override
  bool isValid() {
    return Validator.isRequired(name, 'name', errors);
  }
}
