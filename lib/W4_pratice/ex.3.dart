import 'package:flutter/material.dart';

// CustomButton code here
enum ButtonType { primary, secondary, disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool iconPositionRight;
  final ButtonType buttonType;

  const CustomButton({
    Key? key,
    required this.label,
    required this.icon,
    this.iconPositionRight = false,
    this.buttonType = ButtonType.primary,
  }) : super(key: key);

  Color getButtonColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled ? null : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: getButtonColor(),
        disabledForegroundColor: Colors.grey.withOpacity(0.38),
        disabledBackgroundColor:
            Colors.grey.withOpacity(0.12), // color for disabled state
        minimumSize: const Size(150, 40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!iconPositionRight) Icon(icon, size: 16),
          if (!iconPositionRight) const SizedBox(width: 8),
          Text(label),
          if (iconPositionRight) const SizedBox(width: 8),
          if (iconPositionRight) Icon(icon, size: 16),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ButtonDemoScreen(),
    );
  }
}

class ButtonDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Button Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: "Submit",
              icon: Icons.check,
              iconPositionRight: false,
              buttonType: ButtonType.primary,
            ),
            SizedBox(height: 16),
            CustomButton(
              label: "Time",
              icon: Icons.access_time,
              iconPositionRight: true,
              buttonType: ButtonType.secondary,
            ),
            SizedBox(height: 16),
            CustomButton(
              label: "Account",
              icon: Icons.account_circle,
              iconPositionRight: false,
              buttonType: ButtonType.disabled,
            ),
          ],
        ),
      ),
    );
  }
}