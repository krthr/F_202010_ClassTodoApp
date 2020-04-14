import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/pages/new_todo_dialog.dart';
import 'package:f_202010_todo_class/model/todo.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        var element = todos[index];
        return _item(element, index);
      },
    );
  }

  Widget _item(Todo element, int index) {
    return Dismissible(
      background: Container(
        padding: EdgeInsets.all(5.0),
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: Text(
          "Deleting...",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          todos.removeAt(index);
        });
      },
      child: Card(
        child: ListTile(
          title: Text(element.title),
          subtitle: Text(element.body),
          isThreeLine: true,
        ),
        color: element.completed ? Colors.blueGrey : Colors.yellow[200],
      ),
    );
  }

  void _addTodo() async {
    final todo = await showDialog<Todo>(
        context: context, builder: (BuildContext context) => NewTodoDialog());

    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }
}
