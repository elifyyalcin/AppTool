import 'package:flutter/material.dart';
import 'package:myapptools/data/dbHelper.dart';
import 'package:myapptools/models/todo.dart';

class TodoDetail extends StatefulWidget {
  Todo todo;
  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() {
    return _TodoDetailState(this.todo);
  }
}

enum Options { delete, update }

class _TodoDetailState extends State {
  Todo todo;
  _TodoDetailState(this.todo);
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();

  @override
  void initState() {
    txtName.text = todo.name;
    txtDescription.text = todo.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Detail: ${todo.name}"),
      ),
      body: buildTodoDetail(),
    );
  }

  Widget buildTodoDetail() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          buildNameField(),
          buildDescriptionField(),
          buildUpdateButton(),
        ],
      ),
    );
  }

  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Task"),
      controller: txtName,
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Task Description"),
      controller: txtDescription,
    );
  }

  Widget buildUpdateButton(){
    return FlatButton(
      color: Colors.amber,
      child: Text("SAVE"),
      onPressed: () { updateTodo();}
    );
  }


  void updateTodo() async {
    await dbHelper.update(Todo.withId(
      id: todo.id,
      name: txtName.text,
      description: txtDescription.text,
    ));
    Navigator.pop(context, true);
  }

}