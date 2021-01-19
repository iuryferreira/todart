import '../repositories/todo.dart';
import '../repositories/user.dart';
import '../../../core.dart';

abstract class ITodoUseCase {
  ITodoRepository repository;
  IUserRepository userRepository;
  Future<TodoDto> add(TodoDto data);
}
