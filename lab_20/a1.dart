// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class User {
//   final int id;
//   final String name;
//   final String email;
//
//   User({required this.id, required this.name, required this.email});
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
// }
//
// // Function to fetch data from the mock API
// Future<List<User>> fetchUsers() async {
//   // Define the mock API URL (Replace with your API endpoint)
//   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//
//   // Check if the response is successful
//   if (response.statusCode == 200) {
//     // Parse the JSON response
//     List jsonResponse = json.decode(response.body);
//     return jsonResponse.map((data) => User.fromJson(data)).toList();
//   } else {
//     throw Exception('Failed to load users');
//   }
// }
//
// class UserListPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User List'),
//       ),
//       body: FutureBuilder<List<User>>(
//         future: fetchUsers(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No users found'));
//           } else {
//             List<User> users = snapshot.data!;
//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: EdgeInsets.all(10),
//                   child: ListTile(
//                     title: Text(users[index].name),
//                     subtitle: Text(users[index].email),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: UserListPage(),
//   ));
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// User Model Class
class User {
  final int id;
  final String name;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  // Factory constructor to parse JSON into User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}

// Function to fetch a single user by ID and query parameter
Future<User> fetchUser(int id, bool extraInfo) async {
  final response = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/users/$id?extraInfo=$extraInfo'));

  if (response.statusCode == 200) {
    // If the response is successful, parse the JSON data
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: 10, // Only show a few users for demonstration
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text('User $index'),
              subtitle: Text('user$index@example.com'),
              onTap: () {
                // Pass user ID and query parameter to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailPage(userId: index + 1, extraInfo: true),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  final int userId;
  final bool extraInfo;

  UserDetailPage({required this.userId, required this.extraInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder<User>(
        future: fetchUser(userId, extraInfo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            User user = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${user.id}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Name: ${user.name}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Email: ${user.email}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Phone: ${user.phone}', style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserListPage(),
  ));
}
