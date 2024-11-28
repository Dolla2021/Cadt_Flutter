import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(50),
            color: Colors.blue[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextContainer("OOP"),
                const SizedBox(height: 20),
                buildTextContainer("DART"),
                const SizedBox(height: 20),
                buildTextContainer("FLUTTER"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextContainer(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[300]!, const Color.fromARGB(255, 172, 199, 223)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
