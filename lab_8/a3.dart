import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack Widget'),),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(child: Image.asset('assets/images/img.png',fit: BoxFit.cover,),),
              Positioned(child: Text('Hello World!!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.cyan),))
            ],
          ),
        ),
      ),
    );
  }
}
