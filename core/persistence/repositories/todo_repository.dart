import 'package:uuid/uuid.dart';
import '../firebase/todo_context.dart';

class TodoRepository {
  final context = new TodoContext();

  Future<dynamic> getAll() async {
    return await context.getAll();
  }

  Future<dynamic> getTodoList(String idTodoList) async {
    return await context.getTodoListById(idTodoList);
  }

  Future<dynamic> getItem(String idTodoList, String idItem) async {
    return await context.getItemById(idTodoList, idItem);
  }

  Future<dynamic> addTodoList(String title) async {
    var todoList = {'title': title, 'items': []};
    return await context.addTodoList(id: Uuid().v4(), todoList: todoList);
  }

  Future<dynamic> addTask(String idTodoList, dynamic task) async {
    task.id = Uuid().v4();
    return await context.addTask(idTodoList, task);
  }

  Future<bool> deleteItem(String idTodoList, String idItem) async {
    return await context.deleteItem(idTodoList, idItem);
  }
}
