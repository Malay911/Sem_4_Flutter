import 'package:flutter/material.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Divide into 9 parts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Row(
        children: [
          // Column 1
          Expanded(
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.red)),
                Expanded(child: Container(color: Colors.green)),
                Expanded(child: Container(color: Colors.blue)),
              ],
            ),
          ),
          // Column 2
          Expanded(
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.brown)),
                Expanded(child: Container(color: Colors.grey)),
                Expanded(child: Container(color: Colors.purpleAccent)),
              ],
            ),
          ),
          // Column 3
          Expanded(
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.black)),
                Expanded(child: Container(color: Colors.red)),
                Expanded(child: Container(color: Colors.orange)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}