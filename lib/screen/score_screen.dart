import 'package:flutter/material.dart';
import 'package:word_quiz_app/model/word_quiz.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int correctAnswer;
  const ScoreScreen(
      {super.key, required this.score, required this.correctAnswer});

  @override
  Widget build(BuildContext context) {
    getPercentage() {
      return (correctAnswer / questions.length * 100) / 100;
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CircularProgressIndicator(
                          value: getPercentage(),
                        ),
                        CircleAvatar(
                          radius: 45,
                          child: Text(
                              "${(correctAnswer / questions.length * 100).toStringAsFixed(0)}%"),
                        ),
                        const SizedBox(width: 15),
                        Text('Score: ${score.toString()} points'),
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
