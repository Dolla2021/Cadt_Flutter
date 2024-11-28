import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // Top blue section
            Container(
              height: 100,
              color: Colors.blue,
            ),
            // Middle section with green and pink containers
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
            // Row of yellow boxes with spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50, // Adjust width if needed
                  height: 100,
                  color: Colors.yellow,
                ),
                const SizedBox(width: 20), // Space between boxes
                Container(
                  width: 50, // Adjust width if needed
                  height: 100,
                  color: Colors.yellow,
                ),
                const SizedBox(width: 20), // Space between boxes
                Container(
                  width: 50, // Adjust width if needed
                  height: 100,
                  color: Colors.yellow,
                ),
              ],
            ),
            // Bottom pink section that takes the remaining space
            Expanded(
              child: Container(
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
