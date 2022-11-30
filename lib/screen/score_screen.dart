import 'package:flutter/material.dart';
import 'package:word_quiz_app/constant.dart';
import 'package:word_quiz_app/model/word_quiz.dart';

class ScoreScreen extends StatefulWidget {
  final int score;
  final int correctAnswer;
  const ScoreScreen(
      {super.key, required this.score, required this.correctAnswer});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  String getPerCentage() =>
      "${(widget.correctAnswer / questions.length * 100).toStringAsFixed(0)}%";
  double getProgressBarValue() =>
      (widget.correctAnswer / questions.length * 100) / 100;

  Color? getColor() {
    if (widget.correctAnswer >= 5) {
      return Colors.green[600];
    } else if (widget.correctAnswer < 5) {
      return Colors.red;
    }
    return Colors.red;
  }

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: duration);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeTransition(
              opacity: animation,
              child: Container(
                alignment: Alignment.center,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Score: ${widget.score.toString()} points',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const Divider(thickness: 1.8, color: Colors.white60),
                      const Spacer(),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SizedBox(
                            height: 88,
                            width: 88,
                            child: CircularProgressIndicator(
                                strokeWidth: 8,
                                color: getColor(),
                                backgroundColor: Colors.white,
                                value: getProgressBarValue()),
                          ),
                          Text(
                            getPerCentage(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${widget.correctAnswer}/${questions.length}',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
