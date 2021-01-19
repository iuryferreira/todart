import '../../shared/repositories/todo.dart';
import '../../shared/repositories/user.dart';
import '../../shared/usecases/todo.dart';
import '../../shared/dtos/todo.dart';
import '../entities/todo.dart';

class TodoUseCase implements ITodoUseCase {
  ITodoRepository repository;
  IUserRepository userRepository;

  TodoUseCase(this.repository, this.userRepository);

  add(TodoDto data) async {
    var todo = data;
    if (todo.isValid()) {
      var userData = await userRepository.find(todo.userId);
      if (userData != null) {
        var entity = Todo.create(todo.name, userData.id);
        todo = entity.toDto();
        if (!await this.repository.add(todo)) {
          todo.errors = repository.errors;
        }
      }
      todo.errors = userRepository.errors;
    }
    return todo;
  }
}
