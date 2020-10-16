import '../entities/todo_item.dart';
import '../entities/todo_list.dart';
import '../firebase/database.dart';

class TodoRepository {
  TodoRepository() {}

  getTodoList(String idTodoList) async {
    var doc = await db.context.collection('todos').document(idTodoList).get();
    return doc.map;
  }

  addTodoList(TodoList list) async {
    await db.context.collection('todos').document(list.id).create(list.toMap());
  }

  addItem(String id, TodoItem item) async {
    var todolist = await db.context.collection('todos').document(id).get();
    List items = new List.from((todolist.map)['items']);
    items.add(item.toMap());
    await db.context.collection('todos').document(id).update({'items': items});
  }

  remove(String id) {
    //this.todoList.items.removeWhere((item) => item.id == id);
  }

  getAll() async {
    await db.signIn();
    var doc = await db.context.collection('todos').get();
    var todos = (doc.map((doc) => {"id": doc.id, "data": doc.map})).toList();
    return todos;
  }
}
