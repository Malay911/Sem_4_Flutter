import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final int id;
  final String title;
  final String body;
  final int userId;

  Post({required this.id, required this.title, required this.body, required this.userId});

  // Factory method to convert JSON to Post model
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API GET with Path and Query Params',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostListScreen(),
    );
  }
}

class PostListScreen extends StatelessWidget {
  final String url = 'https://jsonplaceholder.typicode.com/posts';

  // Function to fetch a single post by ID and userId
  Future<Post> fetchPost(int id, int userId) async {
    final response = await http.get(Uri.parse('$url/$id?userId=$userId'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON data
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Example of passing path and query parameters
    int postId = 1;
    int userId = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts List'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the full-screen page for a specific post
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailScreen(postId: postId, userId: userId),
              ),
            );
          },
          child: Text('View Post $postId'),
        ),
      ),
    );
  }
}

class PostDetailScreen extends StatelessWidget {
  final int postId;
  final int userId;

  PostDetailScreen({required this.postId, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: FutureBuilder<Post>(
        future: fetchPost(postId, userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            Post post = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${post.id}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Title: ${post.title}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Body: ${post.body}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('User ID: ${post.userId}', style: TextStyle(fontSize: 14)),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Function to fetch a single post by ID and userId
  Future<Post> fetchPost(int id, int userId) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id?userId=$userId'));

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
