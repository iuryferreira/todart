import '../errors/error.dart';
import '../validator.dart';
import '../dto.dart';

class TodoDto implements Dto {
  String id;
  String name;
  List<dynamic> items;

  @override
  List<Error> errors;

  TodoDto([this.id, this.name, this.items]);

  @override
  bool isValid() {
    return Validator.isRequired(name, 'name', errors);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'items': items};
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'items': items};
}
