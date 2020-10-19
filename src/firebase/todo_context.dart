import 'database.dart';

class TodoContext {
  Database db;

  TodoContext() {
    db = Database();
  }

  Future<dynamic> getAll() async {
    try {
      var response = await db.firestore.collection('todos').get();
      var todos = response.map((doc) => doc.map).toList();
      return todos;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> getTodoListById(String id) async {
    return (await db.firestore.collection('todos').document(id).get()).map;
  }

  Future<dynamic> getItemById(String idTodoList, idItem) async {
    var items = await _getItems(idTodoList);
    return items.where((item) => item['id'] == idItem).first;
  }

  Future<dynamic> addTodoList({String id, Map<String, Object> todoList}) async {
    return await db.firestore.collection('todos').document(id).create(todoList);
  }

  Future<dynamic> addTask(String idTodoList, dynamic task) async {
    var items = await _getItems(idTodoList);
    items.add(task);
    await db.firestore
        .collection('todos')
        .document(idTodoList)
        .update({'items': items});
    return task;
  }

  Future<bool> deleteItem(String idTodoList, String idItem) async {
    var items = await _getItems(idTodoList);
    items.removeWhere((item) => item['id'] == idItem);
    await db.firestore
        .collection('todos')
        .document(idTodoList)
        .update({'items': items});
    return true;
  }

  Future<List<dynamic>> _getItems(String idTodoList) async {
    var response = await getTodoListById(idTodoList);
    return new List.from(response['items']);
  }
}
