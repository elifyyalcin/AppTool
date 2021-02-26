import 'package:flutter/material.dart';
import 'package:myapptools/screens/calculator.dart';
import 'package:myapptools/screens/todo_list.dart';

import 'screens/bmi_calculator.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false,));

}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My App Tools"),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[600],
          child: Center(
            child: Container(
              width: 300,
              height: 400,
              color: Colors.grey[700],
              child: Column(
                children: [
                  IconButton(
                    iconSize: 75,
                    color: Colors.white,
                    icon: Icon(Icons.playlist_add_check),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoList()));
                    },
                  ),
                  Text("ToDo List"),
                  IconButton(
                    iconSize: 75,
                    color: Colors.white,
                    icon: Icon(Icons.calculate),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Calculator()));
                    },
                  ),
                  Text("Calculator"),
                  IconButton(
                    iconSize: 75,
                    color: Colors.white,
                    icon: Icon(Icons.accessibility_new_rounded),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BmiCalculator()));
                    },
                  ),
                  Text("Bmi Calculator"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}