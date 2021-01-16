import 'package:angel_framework/angel_framework.dart';
import '../../core/shared/services/todo.dart';
import '../../core/shared/dtos/todo.dart';

import '../middlewares/deserialize.dart';

@Expose("/todos")
class TodoController extends Controller {
  ITodoService service;

  TodoController(this.service);

  @Expose("/", method: "POST", middleware: const [deserialize])
  store(RequestContext request, ResponseContext response) async {
    var data = new TodoDto();
    data.name = request.bodyAsMap['name'];
    var result = await service.add(data);
    response.statusCode = 201;
    return result;
  }
}
