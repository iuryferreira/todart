import '../../shared/repositories/user.dart';
import '../../shared/repositories/todo.dart';
import '../../shared/dtos/task.dart';
import '../../shared/usecases/task.dart';
import '../entities/task.dart';

class TaskUseCase implements ITaskUseCase {
  ITodoRepository todorepository;
  IUserRepository userRepository;

  TaskUseCase(this.todorepository, this.userRepository);

  Future<TaskDto> add(TaskDto data) async {
    var task = data;
    if (task.isValid()) {
      var userData = await userRepository.find(id: task.userId);
      if (userData != null) {
        var todo = await todorepository.find(task.todoId, task.userId);
        todo.userId = task.userId;
        if (todo != null) {
          var entity = Task.create(task.message, task.todoId);
          task = entity.toDto();
          todo.items.add(task.toMap());
          if ((await todorepository.update(todo)) == null) {
            task.errors = todorepository.errors;
          }
        }
        task.errors = todorepository.errors;
      }
      task.errors = userRepository.errors;
    }
    return task;
  }
}
