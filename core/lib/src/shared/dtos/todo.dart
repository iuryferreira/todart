import 'package:todart_core/src/shared/errors.dart';

import '../validator.dart';
import '../dto.dart';

class TodoDto implements Dto {
  String id;
  String userId;
  String name;
  List<dynamic> items;
  Errors errors;

  TodoDto([this.id, this.name, this.userId, this.items]) {
    this.errors = Errors();
  }

  bool isValid() {
    var name = Validator.isRequired(this.name, 'name', errors);
    var userId = Validator.isRequired(this.userId, 'userId', errors);
    return name && userId;
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'items': items};
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'items': items};
}
