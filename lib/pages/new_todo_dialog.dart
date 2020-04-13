import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/model/todo.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text(
        "New Todo",
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
      ),
      content: Column(
        children: <Widget>[
          TextField(
            controller: controllerTitle,
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: controllerBody,
            decoration: InputDecoration(labelText: "Body"),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text("Save"),
                onPressed: () {
                  final todo = new Todo(
                      title: controllerTitle.value.text,
                      body: controllerBody.value.text,
                      completed: false);

                  Navigator.of(context).pop(todo);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
