import '../repository.dart';
import '../dtos/task.dart';

abstract class ITaskRepository extends IRepository {
  Future<bool> add(TaskDto entity);
}
