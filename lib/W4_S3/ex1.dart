import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Button Example'),
        ),
        body: Center(
          child: SelectionButton(),
        ),
      ),
    );
  }
}

class SelectionButton extends StatefulWidget {
  @override
  _SelectionButtonState createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: _toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey,
        ),
        child: Center(
          child: Text(
            isSelected ? 'Selected' : 'Not selected',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
