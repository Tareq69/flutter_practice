import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isImportant = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My Counter App",
        home: Scaffold(
            appBar: (AppBar(
              title: Center(
                child: Text("Tareq's counter app"),
              ),
              backgroundColor: Colors.indigo,
              toolbarHeight: 60,
            )),
            body: Center(
              child: Text("${isImportant ? 'Yes' : 'No'}"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  isImportant = !isImportant;
                });
              },
              child: Icon(Icons.toggle_on),
            )));
  }
}
