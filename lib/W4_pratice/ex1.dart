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
        appBar: AppBar(title: const Text('My Hobbies')),
        body: const HobbiesList(),
      ),
    );
  }
}

class HobbiesList extends StatelessWidget {
  const HobbiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          HobbyCard(
            icon: Icons.flight_takeoff,
            text: 'Travelling',
            backgroundColor: Colors.green,
          ),
          SizedBox(height: 10),
          HobbyCard(
            icon: Icons.ice_skating,
            text: 'Skating',
            backgroundColor: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;

  const HobbyCard({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
