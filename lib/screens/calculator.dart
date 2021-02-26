import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  double result = 0;
  TextEditingController txtFirstOperand = TextEditingController();
  TextEditingController txtSecondOperand = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "calculator",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, true),
          ),
          title: Text("CALCULATOR"),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    //padding: EdgeInsets.all(30.0),
                    width: 300,
                    height: 175,
                    child: Column(
                      children: [
                        firstOperandField(),
                        secondOperandField(),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 10.0),
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              result = double.tryParse(txtFirstOperand.text) +
                                  double.tryParse(txtSecondOperand.text);
                            });
                          },
                        ),
                        ElevatedButton(
                          child: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              result = double.tryParse(txtFirstOperand.text) -
                                  double.tryParse(txtSecondOperand.text);
                            });
                          },
                        ),
                        ElevatedButton(
                          child: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              result = double.tryParse(txtFirstOperand.text) *
                                  double.tryParse(txtSecondOperand.text);
                            });
                          },
                        ),
                        ElevatedButton(
                          child: Center(
                            child: Text("/"),
                          ),
                          onPressed: () {
                            setState(() {
                              result = double.tryParse(txtFirstOperand.text) /
                                  double.tryParse(txtSecondOperand.text);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Text("Result:" + "  " + result.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstOperandField() {
    return TextField(
      decoration: InputDecoration(labelText: "First Operand.."),
      controller: txtFirstOperand,
    );
  }

  Widget secondOperandField() {
    return TextField(
      decoration: InputDecoration(labelText: "Second Operand.."),
      controller: txtSecondOperand,
    );
  }
}
