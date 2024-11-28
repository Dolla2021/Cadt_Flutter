import 'package:flutter/material.dart';
// import 'package:flutter_first_project/W7/lib/widgets/app_button.dart';
// AppButton(icon: Icons.arrow_right_alt, 'Start Quiz', onTap: onFinish)
import 'package:flutte_demo/W7 - S2 - FLUTTER QUIZ/lib/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final void Function(String) onFinish;
  final Question question;

  const QuestionScreen(
      {required this.question, required this.onFinish, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        const SizedBox(height: 20),
        ...question.possibleAnswers.map((answer) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.50),
                      ),
                      onPressed: () {
                        onFinish(answer);
                      },
                      child: Text(
                        answer,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
