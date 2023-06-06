import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/data/question_data.dart';
import 'package:quiz/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedanswers});
  final List<String> selectedanswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedanswers.length; i++) {
      summary.add({
        'questionind': i,
        'question': questions[i].text,
        'correctans': questions[i].answers[0],
        'sleans': selectedanswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final Summarydata = getSummary();
    final totalques = questions.length;
    final correctques = Summarydata.where((data) {
      return data['correctans'] == data['sleans'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Center(
            child: Container(
                margin: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You Answered $correctques out of $totalques questions Correct",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    QuestionSummary(
                      summarydata: Summarydata,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ))));
  }
}
