import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/data/question_data.dart';
import 'package:quiz/question.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/start.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> selAnswer = [];
  var activescreen = 'start-page';

  void changeScreen() {
    setState(() {
      activescreen = 'question-page';
    });
  }

  void chooseAnswer(String answer) {
    selAnswer.add(answer);
    if (selAnswer.length == questions.length) {
      setState(() {
        activescreen = 'result-page';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartPage(changeScreen);
    if (activescreen == 'question-page') {
      screenWidget = QuestionPage(selectedAnswer: chooseAnswer);
    }
    if (activescreen == 'result-page') {
      screenWidget = ResultScreen(
        selectedanswers: selAnswer,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Application',
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: screenWidget,
      )),
    );
  }
}
