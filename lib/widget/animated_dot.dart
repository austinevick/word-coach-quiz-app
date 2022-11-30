import 'package:flutter/material.dart';

import '../model/word_quiz.dart';

class AnimatedDots extends StatelessWidget {
  final int index;
  const AnimatedDots({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          questions.length,
          (i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AnimatedContainer(
                  height: index == i ? 10 : 5,
                  width: index == i ? 10 : 5,
                  duration: const Duration(milliseconds: 1000),
                  decoration: BoxDecoration(
                      color: index == i ? Colors.red : Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                ),
              )),
    );
  }
}
