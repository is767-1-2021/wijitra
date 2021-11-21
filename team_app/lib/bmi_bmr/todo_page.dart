import 'package:flutter/material.dart';

import 'todo_controller.dart';
import 'todo_model.dart';

class TodoPage extends StatefulWidget {
  final TodoController controller;

  TodoPage({required this.controller});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getTodos() async {
    var newTodos = await widget.controller.fectTodos();

    setState(() {
      todos = newTodos;
    });
  }

  void _updateTodos(int _id, bool _completed) async {
    await widget.controller.updateTodo(_id, _completed);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: todos.isEmpty ? 1 : todos.length,
          itemBuilder: (context, index) {
            if (todos.isEmpty) {
              return Text("Tap button to fetch Todos");
            }
            return CheckboxListTile(
              onChanged: (bool? value) {
                setState(() {
                  todos[index].completed = value!;
                  _updateTodos(todos[index].id, value);
                });
              },
              //onChanged: null,
              value: todos[index].completed,
              //value: value,
              //onChanged: (value) =>
              //  setState(() => this.todos[index].completed = value!),
              //value: todo.isDone,
              /*onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);*/

              title: Text(todos[index].title),
            );
          },
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Todos'),
      ),
      body: Center(
        child: body,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTodos,
        //onPressed: () {
        //var instance = FirebaseFirestore.instance.collection('todos');
        // },
        child: Icon(Icons.add),
      ),
    );
  }
}
