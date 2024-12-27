import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Text Widget Example'),
          backgroundColor: Colors.yellowAccent,
        ),
        body: const Center(
          child: Column(
            children: [
              CustomText(
                text: "Hello, Flutter!",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              CustomText(
                text: "Custom Text",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Text Widget
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
