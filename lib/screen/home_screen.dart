import 'package:flutter/material.dart';
import 'package:word_quiz_app/model/word_quiz.dart';
import 'package:word_quiz_app/widget/animated_button.dart';
import 'package:word_quiz_app/widget/animated_dot.dart';
import 'package:word_quiz_app/widget/card_app_bar.dart';

import '../constant.dart';
import 'score_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController();
  int index = 0;
  int score = 0;
  int correctAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 320,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CardAppBar(score: score),
                  const Divider(thickness: 1.8, color: Colors.white60),
                  const SizedBox(height: 20),
                  Expanded(
                    child: PageView.builder(
                        controller: controller,
                        onPageChanged: (i) => setState(() => index = i),
                        itemCount: questions.length,
                        itemBuilder: ((context, i) {
                          final q = questions[i];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  questions[i].question!,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Spacer(),
                                const SizedBox(height: 10),
                                AnimatedButton(
                                    color: questions[0].color,
                                    options: q.option1!,
                                    onTap: () {
                                      setState(() {
                                        if (q.option1!
                                            .contains(questions[i].answer!)) {
                                          score += 10;
                                          correctAnswer++;
                                          questions[0].color = Colors.green;
                                          questions[0].icon = Icons.check;
                                        } else if (!questions[i]
                                            .option1!
                                            .contains(questions[i].answer!)) {
                                          questions[0].color = Colors.red;
                                          questions[0].icon = Icons.clear;
                                        }
                                        questions[0].showIcon = true;
                                      });
                                      Future.delayed(
                                          duration,
                                          () => setState(() {
                                                questions[0].showIcon = false;
                                                questions[0].color =
                                                    Colors.transparent;
                                                if (i < questions.length - 1) {
                                                  controller.nextPage(
                                                      duration: duration,
                                                      curve: Curves.ease);
                                                } else if (i ==
                                                    questions.length - 1) {
                                                  i = 0;
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              ScoreScreen(
                                                                score: score,
                                                                correctAnswer:
                                                                    correctAnswer,
                                                              )));
                                                }
                                              }));
                                    },
                                    icon: questions[0].icon,
                                    showIcon: questions[0].showIcon),
                                const SizedBox(height: 10),
                                const Text('Or'),
                                const SizedBox(height: 10),
                                AnimatedButton(
                                    color: questions[1].color,
                                    options: questions[i].option2!,
                                    onTap: () {
                                      setState(() {
                                        if (q.option1!
                                            .contains(questions[i].answer!)) {
                                          score += 10;
                                          correctAnswer++;
                                          questions[1].color = Colors.green;
                                          questions[1].icon = Icons.check;
                                        } else if (!questions[i]
                                            .option1!
                                            .contains(questions[i].answer!)) {
                                          questions[1].color = Colors.red;
                                          questions[1].icon = Icons.clear;
                                        }
                                        questions[1].showIcon = true;
                                      });
                                      Future.delayed(
                                          duration,
                                          () => setState(() {
                                                questions[1].showIcon = false;
                                                questions[1].color =
                                                    Colors.transparent;
                                                if (i < questions.length - 1) {
                                                  controller.nextPage(
                                                      duration: duration,
                                                      curve: Curves.ease);
                                                } else if (i ==
                                                    questions.length - 1) {
                                                  i = 0;
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              ScoreScreen(
                                                                score: score,
                                                                correctAnswer:
                                                                    correctAnswer,
                                                              )));
                                                }
                                              }));
                                    },
                                    icon: questions[1].icon,
                                    showIcon: questions[1].showIcon),
                              ],
                            ),
                          );
                        })),
                  ),
                  const SizedBox(height: 25),
                  AnimatedDots(index: index)
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
