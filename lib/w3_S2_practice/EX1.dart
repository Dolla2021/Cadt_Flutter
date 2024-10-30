import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello my name is DOLLA',
            style: TextStyle(
              fontSize: 50,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
