import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'answer_button.dart';
import 'data/question_data.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.selectedAnswer});

  final void Function(String answer) selectedAnswer;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var curquesind = 0;
  void updateind(String answer) {
    widget.selectedAnswer(answer);
    setState(() {
      curquesind++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currques = questions[curquesind];
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currques.text,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              // ... is spread operator to convert into comma seprated values....//
              ...currques.getShuffAns().map((item) {
                return AnswerButton(
                    Answertext: item,
                    press: () {
                      updateind(item);
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
