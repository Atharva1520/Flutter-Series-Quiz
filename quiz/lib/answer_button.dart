import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key,
      // ignore: non_constant_identifier_names
      required this.Answertext,
      required this.press});
  final String Answertext;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: Color.fromARGB(255, 64, 6, 164),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: press,
        child: Text(
          Answertext,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
