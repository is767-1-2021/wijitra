import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/controllers/todo.dart';
import 'package:first_app/models/todo.dart';
import 'package:flutter/material.dart';

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

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: todos.isEmpty ? 1 : todos.length,
          itemBuilder: (context, index) {
            if (todos.isEmpty) {
              return Text("Tap button to fetch Todos");
            }

            return CheckboxListTile(
              onChanged: null,
              value: todos[index].completed,
              title: Text(todos[index].title),
            );
          },
        );
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    /*return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {*/
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Todos'),
      ),
      body: Center(
        child: body,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTodos,
        child: Icon(Icons.add),
      ),
    );
  }

  /* return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });}*/
}
