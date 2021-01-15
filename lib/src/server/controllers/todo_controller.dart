import 'package:angel_framework/angel_framework.dart';
import '../../core/shared/services/todo_service.dart';
import '../../core/services/todo_service.dart';
import '../../core/shared/dtos/todo.dart';
import '../../core/shared/presenter.dart';
import '../../core/domain/usecases/todo/create_todo_usecase.dart';
import '../../core/persistence/database.dart';
import '../../core/persistence/repositories/todo_repository.dart';

import '../middlewares/deserialize.dart';

@Expose("/todos")
class TodoController extends Controller {
  ITodoService service;

  @Expose("/", method: "POST", middleware: const [deserialize])
  store(RequestContext request, ResponseContext response) async {
    var db = Database.instance;
    var repository = TodoRepository(db);
    var presenter = Presenter<TodoDto>();
    var createTodoUseCase = CreateTodoUseCase(repository, presenter);
    this.service = TodoService(createTodoUseCase);
    var data = new TodoDto();
    data.name = request.bodyAsMap['name'];
    var result = await service.add(data);
    response.statusCode = 201;
    return result;
  }
}
