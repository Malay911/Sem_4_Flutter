// Write a flutter code to list data into the List view.
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PriorityListScreen()));
}

class PriorityListScreen extends StatelessWidget {
  final List<Task> tasks = [
    Task("abc", Colors.red),
    Task("def", Colors.green),
    Task("ghi", Colors.orange),
    Task("jkl", Colors.green),
    Task("lmn", Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Priority List")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            color: task.color,
            child: ListTile(
              title: Text(
                task.name,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Task {
  final String name;
  final Color color;

  Task(this.name, this.color);
}