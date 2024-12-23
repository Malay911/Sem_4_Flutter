import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextField with Custom Styling"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Custom Styled TextField",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  hintText: "Malay Panara",
                  labelStyle: TextStyle(color: Colors.blue),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  print('Input: ${controller.text}');
                },
                child: Text("Print Input"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}