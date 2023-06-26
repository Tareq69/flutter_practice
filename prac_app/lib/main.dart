import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My sample app",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: myBody(),
      ),
    );
  }
}

class myBody extends StatelessWidget {
  const myBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Sample app"),
    );
  }
}
