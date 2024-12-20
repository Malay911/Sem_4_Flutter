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
                Expanded(child: Container(color: Colors.blueGrey),flex: 5,),
                Expanded(child: Container(color: Colors.orange),flex: 8,),
                Expanded(child: Container(color: Colors.blueAccent),flex: 8,),
              ],
            ),
          ),
          // Column 2
          Expanded(
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.brown),flex: 6,),
                Expanded(child: Container(color: Colors.green),flex: 6,),
                Expanded(child: Container(color: Colors.grey),flex: 4,),
              ],
            ),
          ),
          // Column 3
          Expanded(
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.red),flex: 4,),
                Expanded(child: Container(color: Colors.yellow),flex: 5,),
                Expanded(child: Container(color: Colors.purpleAccent),flex: 7,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}