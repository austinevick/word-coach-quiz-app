import 'package:flutter/material.dart';

class CardAppBar extends StatelessWidget {
  final int score;
  const CardAppBar({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'Word coach',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        const Text(
          'Score: ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Text(
          score.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
