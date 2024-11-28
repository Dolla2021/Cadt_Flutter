import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final Question question; // Fixed typo
  final String? userAnswer;
  final int questionNumber;
  final bool isCorrect;

  const ResultItem({
    required this.isCorrect,
    required this.questionNumber,
    required this.question,
    this.userAnswer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: isCorrect ? Colors.lightGreen : Colors.red,
                  child: Text(
                    '$questionNumber',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // Question title
              Expanded(
                child: Text(
                  question.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Display all answers
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: question.possibleAnswers.map((answer) {
              bool isAnswerCorrect = answer == question.goodAnswer;
              bool isUserAnswer =
                  userAnswer != null && answer == userAnswer; // Null check

              IconData? icon = isAnswerCorrect ? Icons.check_circle : null;
              Color? iconColor = Colors.lightGreen;
              Color textColor = isUserAnswer
                  ? (isAnswerCorrect ? Colors.lightGreen : Colors.red)
                  : Colors.black;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 4.0),
                        child: Icon(
                          icon,
                          color: iconColor,
                          size: 20,
                        ),
                      ),
                    Expanded(
                      child: Text(
                        answer,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 19,
                          fontWeight: isUserAnswer
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Example Question class
class Question {
  final String title;
  final String goodAnswer;
  final List<String> possibleAnswers;

  Question({
    required this.title,
    required this.goodAnswer,
    required this.possibleAnswers,
  });
}
