import '../usecases/task.dart';
import '../dtos/task.dart';

abstract class ITaskService {
  ITaskUseCase usecase;
  Future<TaskDto> add(TaskDto data);
}
