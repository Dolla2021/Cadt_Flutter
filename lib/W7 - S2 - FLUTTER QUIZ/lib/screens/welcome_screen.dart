import 'package:flutter/material.dart';
import 'package:flutte_demo/W7 - S2 - FLUTTER QUIZ/lib/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final String quizTitle;
  const WelcomeScreen(
      {required this.quizTitle, required this.onStart, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset('assets/quiz-logo.png'),
        ),
        const SizedBox(height: 10),
        Text(
          quizTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        AppButton(icon: Icons.arrow_right_alt, 'Start Quiz', onTap: onStart)
      ],
    );
  }
}
