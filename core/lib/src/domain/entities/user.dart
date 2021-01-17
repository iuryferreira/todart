import 'package:uuid/uuid.dart';
import 'package:password/password.dart';

import '../../shared/dtos/user.dart';
import 'todo.dart';

class User {
  String id;
  String name;
  String username;
  String password;
  List<Todo> todos;

  User(this.id, this.name, this.username, this.password, this.todos);

  static User create(String name, String username, String password) {
    return new User(Uuid().v4(), name, username,
        Password.hash(password, PBKDF2()), <Todo>[]);
  }

  void addTodo(Todo todo) {
    this.todos.add(todo);
  }

  UserDto cast() {
    var data = new UserDto(
        this.id, this.name, this.username, this.password, this.todos);
    // if (this.todos.isEmpty) {
    //   data.todos = [];
    // } else {
    //   for (var todo in this.todos) {
    //     data.todos.add(TodoDto(todo.id, todo.name, todo.items));
    //   }
    // }
    return data;
  }
}
