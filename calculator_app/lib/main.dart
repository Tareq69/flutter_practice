import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Calculator",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Calc(),
    );
  }
}

class Calc extends StatelessWidget {
  const Calc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
      ),
      body: MyNumberInputWidget(),
    );
  }
}

class MyNumberInputWidget extends StatefulWidget {
  @override
  _MyNumberInputWidgetState createState() => _MyNumberInputWidgetState();
}

class _MyNumberInputWidgetState extends State<MyNumberInputWidget> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  var num1 = 0;
  var num2 = 0;
  var result = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter a number",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter a number",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  String text1 = _controller.text;
                  String text2 = _controller1.text;
                  num1 = int.parse(text1);
                  num2 = int.parse(text2);
                  result = num1 + num2;
                });
              },
              child: Icon(Icons.add)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text("Sum is: ${result}"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
