import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Lab8_5(),
    debugShowCheckedModeBanner: false,
  ));
}

class Lab8_5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DiceRollScreen(),
    );
  }
}

class DiceRollScreen extends StatefulWidget {
  @override
  _DiceRollScreenState createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends State<DiceRollScreen> {
  int diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roll Dice App'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dice$diceNumber.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),

            Text(
              'Roll Result: $diceNumber',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: rollDice,
              child: const Text(
                'Roll Dice',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
