import 'package:angel_framework/angel_framework.dart';
import '../../app/repositories/todo_repository.dart';
import '../../app/entities/todo_list.dart';
import '../../app/entities/todo_item.dart';
import '../middlewares/deserialize.dart';

@Expose("/todos")
class TodoController extends Controller {
  final TodoRepository repository = new TodoRepository();

  @Expose("/:id")
  getTodoList(id) async {
    return await repository.getTodoList(id);
  }

  @Expose("/")
  all() async {
    return await repository.getAll();
  }

  @Expose("/", method: "POST", middleware: const [deserialize])
  storeList(RequestContext req, res) async {
    var response = req.bodyAsMap;
    return repository.addTodoList(TodoList(response['title']));
  }

  @Expose("/:id", method: "POST", middleware: const [deserialize])
  storeItem(RequestContext req, res) async {
    var response = req.bodyAsMap;
    return repository.addItem(
        req.params['id'], TodoItem(response['title'], response['task']));
  }
}
