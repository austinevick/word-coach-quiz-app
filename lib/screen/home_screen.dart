import 'package:flutter/material.dart';
import 'package:word_quiz_app/screen/score_screen.dart';

import '../model/word_quiz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  int score = 0;
  int correctAnswer = 0;
  bool showIcon1 = false;
  bool showIcon2 = false;
  Color color1 = Colors.transparent;
  Color color2 = Colors.transparent;
  final duration = const Duration(milliseconds: 1000);
  IconData icon = Icons.check;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff052714),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Word coach',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      const Text(
                        'Score: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        score.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    questions[index].question!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  AnimatedContainer(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.center,
                    duration: const Duration(milliseconds: 1000),
                    decoration: BoxDecoration(
                        color: color1,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16)),
                    child: MaterialButton(
                        height: 45,
                        minWidth: double.infinity,
                        onPressed: () {
                          setState(() {
                            if (questions[index]
                                .option1!
                                .contains(questions[index].answer!)) {
                              score += 10;
                              correctAnswer++;
                              color1 = Colors.green;
                              icon = Icons.check;
                            } else if (!questions[index]
                                .option1!
                                .contains(questions[index].answer!)) {
                              color1 = Colors.red;
                              icon = Icons.clear;
                            }
                            showIcon1 = true;
                          });
                          Future.delayed(
                              duration,
                              () => setState(() {
                                    showIcon1 = false;
                                    color1 = Colors.transparent;
                                    if (index < questions.length - 1) {
                                      index++;
                                    } else if (index == questions.length - 1) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (ctx) => ScoreScreen(
                                                score: score,
                                                correctAnswer: correctAnswer,
                                              ));
                                    }
                                  }));
                        },
                        padding: const EdgeInsets.all(0),
                        child: AnimatedSwitcher(
                            duration: duration,
                            child: !showIcon1
                                ? Text(questions[index].option1!)
                                : Icon(icon))),
                  ),
                  const SizedBox(height: 16),
                  AnimatedContainer(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.center,
                    duration: const Duration(milliseconds: 1000),
                    decoration: BoxDecoration(
                        color: color2,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16)),
                    child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (questions[index]
                                .option2!
                                .contains(questions[index].answer!)) {
                              score += 10;
                              correctAnswer++;
                              color2 = Colors.green;
                              icon = Icons.check;
                            } else if (!questions[index]
                                .option2!
                                .contains(questions[index].answer!)) {
                              color2 = Colors.red;
                              icon = Icons.clear;
                            }
                            showIcon2 = true;
                          });
                          Future.delayed(
                              duration,
                              () => setState(() {
                                    showIcon2 = false;
                                    color2 = Colors.transparent;
                                    if (index < questions.length - 1) {
                                      index++;
                                    } else if (index == questions.length - 1) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (ctx) => ScoreScreen(
                                                score: score,
                                                correctAnswer: correctAnswer,
                                              ));
                                    }
                                  }));
                        },
                        minWidth: double.infinity,
                        height: 45,
                        padding: const EdgeInsets.all(0),
                        child: AnimatedSwitcher(
                            duration: duration,
                            child: !showIcon2
                                ? Text(questions[index].option2!)
                                : Icon(icon))),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        questions.length,
                        (i) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: AnimatedContainer(
                                height: index == i ? 10 : 5,
                                width: index == i ? 10 : 5,
                                duration: duration,
                                decoration: BoxDecoration(
                                    color:
                                        index == i ? Colors.red : Colors.grey,
                                    borderRadius: BorderRadius.circular(16)),
                              ),
                            )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
