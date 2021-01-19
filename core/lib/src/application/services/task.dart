import '../../shared/services/task.dart';
import '../../shared/usecases/task.dart';
import '../../shared/dtos/task.dart';

class TaskService implements ITaskService {
  ITaskUseCase usecase;

  TaskService(this.usecase);

  add(TaskDto data) async {
    return await usecase.add(data);
  }
}
