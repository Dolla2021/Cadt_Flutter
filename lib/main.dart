import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.title, required this.gradient, super.key});
  final String title;
  final Gradient? gradient;
  // nullable cus
  //final Color color; plain color
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        //color: color, using plain color
        // for gradient

        gradient: gradient ??
            const LinearGradient(
                // in case gradient isnt provided by user, it will use this default value
                colors: [Color(0xff4e7df5), Color.fromARGB(255, 5, 34, 109)]),
      ),

      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 35,
            decoration: TextDecoration.none,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      child: const Column(
        children: [
          CustomCard(
            title: "FLUTTER",
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.deepOrangeAccent],
            ),
          ),
          CustomCard(
            title: "DART",
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.black],
            ),
          ),
          CustomCard(
            title: "OOP",
            gradient: LinearGradient(
              colors: [Colors.red, Colors.purple],
            ),
          ),
          // CustomCard(title: "OOP",color: Colors.pink), how u pass plain color
        ],
      ),
    ),
  ));
}
