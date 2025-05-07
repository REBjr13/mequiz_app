class QuizQuestions {
  const QuizQuestions(this.test, this.answers);

  final String test;
  final List<String> answers;

  List get shuffled{
    final shuffledList = List.of(answers);
    shuffledList.shuffle(); //Thus coppies a list.
return shuffledList;
  }
}