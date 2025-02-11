import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Priority List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PriorityListView(),
    );
  }
}

class PriorityListView extends StatelessWidget {
  // Sample data with different priorities
  final List<Map<String, dynamic>> items = [
    {'task': 'Finish homework', 'priority': 'High'},
    {'task': 'Clean the house', 'priority': 'Low'},
    {'task': 'Prepare for presentation', 'priority': 'High'},
    {'task': 'Go grocery shopping', 'priority': 'Medium'},
    {'task': 'Read a book', 'priority': 'Low'},
    {'task': 'Write blog post', 'priority': 'Medium'},
  ];

  // Method to return different colors based on priority
  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red; // High priority - Red
      case 'Medium':
        return Colors.orange; // Medium priority - Orange
      case 'Low':
        return Colors.green; // Low priority - Green
      default:
        return Colors.black; // Default to black if no priority is found
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Priority List View'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          String task = items[index]['task'];
          String priority = items[index]['priority'];
          Color priorityColor = getPriorityColor(priority);

          return Card(
            color: priorityColor.withOpacity(0.2), // Set card background color
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                task,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Priority: $priority'),
              leading: Icon(
                Icons.flag,
                color: priorityColor,
              ),
            ),
          );
        },
      ),
    );
  }
}