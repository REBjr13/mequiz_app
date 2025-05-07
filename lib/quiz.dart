import 'package:flutter/material.dart';

import 'package:advanced_basics/data/questions_bank.dart';
import 'package:advanced_basics/front_screen.dart';
import 'package:advanced_basics/questions_screen.dart';
import 'package:advanced_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void chooseOne(String answer) {
    selectedAnswers.add(answer); //to add things to a list

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen =
            'results-screen'; //swiches screen after we run out of answers
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget =
        activeScreen ==
                'start-screen' //condition
            ? FrontScreen(switchScreen) //value used if true
            : QuestionsScreen(
              onSeletAnswer: chooseOne,
            ); //this also works by storing it all in a variable

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 36, 47, 126),
                const Color.fromARGB(255, 31, 22, 33),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          // activeScreen ==
          //         'start-screen' //condition
          //     ? FrontScreen(switchScreen) //value used if true
          //     : const QuestionsScreen(), //value used if false
        ),
      ),
    );
  }
}
