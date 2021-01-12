import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import '../middlewares/deserialize.dart';
import '../../../core/persistence/repositories/todo_repository.dart';

@Expose("/todos")
class TodoController extends Controller {
  final TodoRepository repository = new TodoRepository();

  @Expose("/:id")
  getTodoList(id) async {
    return await repository.getTodoList(id);
  }

  @Expose("/")
  all(HttpRequestContext req, HttpResponseContext res) async {
    var todolists = await repository.getAll();
    if (todolists == null) {
      res.statusCode = 500;
    }
    return todolists;
  }

  @Expose("/", method: "POST", middleware: const [deserialize])
  storeList(RequestContext req, res) async {
    var response = req.bodyAsMap;
    return repository.addTodoList(response['title']);
  }

  @Expose("/:id", method: "POST", middleware: const [deserialize])
  storeItem(RequestContext req, res) async {
    var response = req.bodyAsMap;
    var task = repository.addTask(req.params['id'], {response['task']});
    res.statusCode = 201;
    return task;
  }

  @Expose("/:id", method: "DELETE", middleware: const [deserialize])
  deleteItem(HttpRequestContext req, HttpResponseContext res) async {
    var body = req.bodyAsMap;
    await repository.deleteItem(req.params['id'], body['id']);
  }
}
