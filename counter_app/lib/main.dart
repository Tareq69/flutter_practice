import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My first app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: myBody(),
    );
  }
}

class myBody extends StatelessWidget {
  const myBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My first app"),
      ),
      body: Center(child: myContent()),
    );
  }
}

class myContent extends StatelessWidget {
  const myContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text("Phone"),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share_location),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text("Share"),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
