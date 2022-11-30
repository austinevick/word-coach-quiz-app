import 'package:flutter/material.dart';
import 'package:word_quiz_app/model/word_quiz.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const Test());
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final controller = PageController();
  final duration = const Duration(milliseconds: 1000);
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
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            child: PageView.builder(
                controller: controller,
                onPageChanged: (i) => setState(() => index = i),
                itemCount: questions.length,
                itemBuilder: ((context, i) {
                  return Padding(
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
                        const Spacer(),
                        Text(questions[i].question!),
                        AnimatedContainer(
                          height: 45,
                          width: double.infinity,
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 1000),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16)),
                          child: MaterialButton(
                              height: 45,
                              minWidth: double.infinity,
                              onPressed: () {},
                              padding: const EdgeInsets.all(0),
                              child: AnimatedSwitcher(
                                  duration: duration,
                                  child: Text(questions[i].option1!))),
                        ),
                        const SizedBox(height: 10),
                        const Text('Or'),
                        const SizedBox(height: 10),
                        AnimatedContainer(
                          height: 45,
                          width: double.infinity,
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 1000),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16)),
                          child: MaterialButton(
                              height: 45,
                              minWidth: double.infinity,
                              onPressed: () {},
                              padding: const EdgeInsets.all(0),
                              child: AnimatedSwitcher(
                                  duration: duration,
                                  child: Text(questions[i].option2!))),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              questions.length,
                              (i) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: AnimatedContainer(
                                      height: index == i ? 10 : 5,
                                      width: index == i ? 10 : 5,
                                      duration: duration,
                                      decoration: BoxDecoration(
                                          color: index == i
                                              ? Colors.red
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                    ),
                                  )),
                        )
                      ],
                    ),
                  );
                })),
          ),
        ),
      )),
    );
  }
}
