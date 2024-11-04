import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Hobbies')),
        body: HobbiesList(),
      ),
    );
  }
}

class HobbiesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
    Key? key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
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
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(
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
