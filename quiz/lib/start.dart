import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.StartQuiz, {Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  final void Function() StartQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/image.jpg',
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Learn Flutter the fun way!',
            style: TextStyle(
                fontSize: 24, color: Color.fromARGB(255, 201, 187, 187))),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 2), shape: const StadiumBorder()),
          onPressed: StartQuiz,
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.black,
          ),
          label: const Text(
            "Start Quiz",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
