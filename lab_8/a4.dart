import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Lab8_4(),
    debugShowCheckedModeBanner: false,
  ));
}

class Lab8_4 extends StatefulWidget {
  const Lab8_4({super.key});

  @override
  _Lab8_4State createState() => _Lab8_4State();
}

class _Lab8_4State extends State<Lab8_4> {
  final TextEditingController nameController = TextEditingController();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday Card'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Name',
                      hintText: 'My Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        name = nameController.text.isEmpty
                            ? "Please enter your name!"
                            : "Happy Birthday \n${nameController.text}";
                      });
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 400, // Set a fixed height for the image and text container
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/img_1.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Text(
                        'Image not found!',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}