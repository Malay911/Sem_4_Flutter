import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World Example'),
        ),
        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.blue,
              backgroundColor: Colors.yellowAccent,
              fontWeight: FontWeight.bold,
              // letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}