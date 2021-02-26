import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapptools/data/dbHelper.dart';
import 'package:myapptools/models/todo.dart';
import 'package:myapptools/screens/todo_add.dart';
import 'package:myapptools/screens/todo_detail.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State {
  DbHelper dbHelper = new DbHelper();
  List<Todo> todos;
  int todoCount = 0;

  @override
  void initState() {
    getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("TODO LIST"),
      ),
      body: buildTodoList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          goToTodoAdd();
        },
        child: Icon(Icons.add),
        tooltip: "add a new task",
      ),
    );
  }

  ListView buildTodoList() {
    return ListView.builder(
        itemCount: todoCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.orange,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text("${position + 1}"),
              ),
              trailing: Container(
                width: 100,
                height: 40,
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.check_circle),
                    onPressed: () {
                      setState(() {
                        dbHelper.delete(todos[position].id);
                      });
                      initState();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        dbHelper.delete(todos[position].id);
                      });
                      initState();
                    },
                  )
                ]),
              ),
              title: Text(this.todos[position].name),
              subtitle: Text(this.todos[position].description),
              onTap: () => goToDetail(this.todos[position]),
            ),
          );
        });
  }

  void goToTodoAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoAdd()));
    if (result != null) {
      if (result) {
        getTodos();
      }
    }
  }

  void goToDetail(Todo todo) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => TodoDetail(todo)));
    if (result != null) {
      if (result) {
        getTodos();
      }
    }
  }

  void getTodos() async {
    var todosFuture = dbHelper.getTodo();
    todosFuture.then((data) {
      setState(() {
        this.todos = data;
        todoCount = data.length;
      });
    });
  }


}