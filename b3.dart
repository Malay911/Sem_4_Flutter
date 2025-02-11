/*
// Write a flutter code to sort data by options: A->Z & Z-A.
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

class PriorityListView extends StatefulWidget {
  @override
  _PriorityListViewState createState() => _PriorityListViewState();
}

class _PriorityListViewState extends State<PriorityListView> {
  // Sample data with different priorities
  List<Map<String, dynamic>> items = [
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

  // Function to sort items based on the selected order
  void _sortItems(String sortOrder) {
    setState(() {
      if (sortOrder == 'A->Z') {
        items.sort((a, b) => a['task'].compareTo(b['task']));
      } else if (sortOrder == 'Z->A') {
        items.sort((a, b) => b['task'].compareTo(a['task']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Priority List View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Row of buttons for sorting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _sortItems('A->Z'),
                  child: Text('Sort A->Z'),
                ),
                ElevatedButton(
                  onPressed: () => _sortItems('Z->A'),
                  child: Text('Sort Z->A'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // List view of tasks
            Expanded(
              child: ListView.builder(
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
            ),
          ],
        ),
      ),
    );
  }
}
*/


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

class PriorityListView extends StatefulWidget {
  @override
  _PriorityListViewState createState() => _PriorityListViewState();
}

class _PriorityListViewState extends State<PriorityListView> {
  // Sample data with different priorities
  List<Map<String, dynamic>> items = [
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

  // Function to sort items based on the selected order
  void _sortItems(String sortOrder) {
    setState(() {
      if (sortOrder == 'A->Z') {
        items.sort((a, b) => a['task'].compareTo(b['task']));
      } else if (sortOrder == 'Z->A') {
        items.sort((a, b) => b['task'].compareTo(a['task']));
      }
    });
  }

  // Function to show dialog for adding a new task
  void _showAddTaskDialog() {
    TextEditingController taskController = TextEditingController();
    String selectedPriority = 'Low'; // Default priority

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Task input field
              TextField(
                controller: taskController,
                decoration: InputDecoration(labelText: 'Task Name'),
              ),
              SizedBox(height: 10),
              // Priority dropdown
              DropdownButton<String>(
                value: selectedPriority,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPriority = newValue!;
                  });
                },
                items: <String>['Low', 'Medium', 'High']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String taskName = taskController.text.trim();

                if (taskName.isNotEmpty) {
                  setState(() {
                    items.add({
                      'task': taskName,
                      'priority': selectedPriority,
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add Task'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Priority List View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Row of buttons for sorting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _sortItems('A->Z'),
                  child: Text('Sort A->Z'),
                ),
                ElevatedButton(
                  onPressed: () => _sortItems('Z->A'),
                  child: Text('Sort Z->A'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // List view of tasks
            Expanded(
              child: ListView.builder(
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
            ),
          ],
        ),
      ),
      // Floating Action Button to add a new task
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }
}
