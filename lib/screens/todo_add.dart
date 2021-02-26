import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapptools/data/dbHelper.dart';
import 'package:myapptools/models/todo.dart';


class TodoAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoAddState();
  }
}

class TodoAddState extends State {
  var dbHelper = DbHelper();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Add New Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),
            buildDescriptionField(),
            //buildUnitPrice(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Todo"),
      controller: txtName,
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Todo description"),
      controller: txtDescription,
    );
  }

  Widget buildSaveButton() {
    return FlatButton(
      color: Colors.amber,
      child: Text("ADD"),
      onPressed: () => addTodo(),
    );
  }

  void addTodo() async {
    await dbHelper.insert(Todo(
      name: txtName.text,
      description: txtDescription.text,
    ));
    Navigator.pop(context, true);
  }
}
