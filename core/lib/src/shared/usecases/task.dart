import '../repositories/task.dart';
import '../repositories/user.dart';
import '../repositories/todo.dart';
import '../dtos/task.dart';

abstract class ITaskUseCase {
  ITaskRepository repository;
  ITodoRepository todorepository;
  IUserRepository userRepository;

  Future<TaskDto> add(TaskDto data);
}
