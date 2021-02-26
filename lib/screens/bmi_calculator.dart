import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//*****************
//bu kısımlarda sadece tasarım örneklerine bakılmıştır, herhangi bir kod örneğinden yararlanılmadı.
//*****************


class BmiCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BmiCalculatorState();
  }
}

class _BmiCalculatorState extends State<BmiCalculator> {

  double result = 0.0;
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "bmicalculator",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, true),
          ),
          title: Text("BMI CALCULATOR"),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 300,
                    height: 125,
                    child: Column(
                      children: [
                        weightField(),
                        heightField(),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                          color: Colors.amber,
                          child: Text("Calculate"),
                          onPressed: () {
                            setState(() {
                              result = double.tryParse(weight.text)/(double.tryParse(height.text)/100*double.tryParse(height.text)/100);
                             // icons = iconFunc(result);
                            });
                          },
                        ),
                        //iconFunc(result),

                        iconFunc(),

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


  Widget iconFunc(){

    if(0.0<result && result<18.5){
      return Container(child: Column(children: [Icon(Icons.sentiment_very_dissatisfied, size: 55,),
      Text("You should gain weight..")]),padding: EdgeInsets.only(top:10.0,bottom: 5.0),);
    }

    else if(result == 0.0){
      return Container(child: Column(
        children: [
          Icon(Icons.accessibility_new_rounded, size: 55,),
        ],
      ),padding: EdgeInsets.only(top:10.0,bottom: 5.0),);
    }

    else if(18.5<=result && result<=24.9){
      return Container(child: Column(
        children: [
          Icon(Icons.sentiment_very_satisfied, size: 55,),
          Text("You are at ideal weight.."),
        ],
      ),padding: EdgeInsets.only(top:10.0,bottom: 5.0),);
      //myText = "You are at ideal weight..";
    }

    else if(24.9<result && result<=29.9){
      return Container(child: Column(
        children: [
          Icon(Icons.sentiment_dissatisfied, size: 55,),
          Text("You should lose some weight.."),
        ],
      ),padding: EdgeInsets.only(top:10.0,bottom: 5.0),);
      //myText = "You should lose some weight..";
    }

    else{
      return Container(child: Column(
        children: [
          Icon(Icons.sentiment_very_dissatisfied, size: 55,),
          Text("You are obese! You should be careful what you eat.."),
        ],
      ),padding: EdgeInsets.only(top:10.0,bottom: 5.0),);
      //myText = "You are obese! You should be careful what you eat..";
    }

  }

  Widget weightField() {
    return TextField(
      decoration: InputDecoration(labelText: "Your weight.."),
      controller: weight,
    );
  }

  Widget heightField() {
    return TextField(
      decoration: InputDecoration(labelText: "Your height.."),
      controller: height,
    );
  }
}