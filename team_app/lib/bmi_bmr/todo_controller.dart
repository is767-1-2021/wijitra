import 'dart:async';

import 'services.dart';
import 'todo_model.dart';

class TodoController {
  final Services services;
  List<Todo> todos = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  TodoController(this.services);

  Future<List<Todo>> fectTodos() async {
    onSyncController.add(true);
    todos = await services.getTodos();
    onSyncController.add(false);
    return todos;
  }

  Future<void> updateTodo(int id, bool completed) async {
    await services.updateTodos(id, completed);
  }
}
