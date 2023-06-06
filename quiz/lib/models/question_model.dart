// ignore: camel_case_types
class quizQuestion {
  const quizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffAns() {
    final shufflist = List<String>.of(answers);
    shufflist.shuffle();
    return shufflist;
  }
}
