import 'package:advanced_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:advanced_basics/data/questions_bank.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSeletAnswer});

  final void Function(String answer) onSeletAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSeletAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++; // to change questions
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.test,
              style: GoogleFonts.eagleLake(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 37, 95, 196),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40), // Made this const
            ...currentQuestion.shuffled.map((answer) {
              //make them standard standalone list seperated with commasc
              return AnswerButton(
                answerText: answer,
                onPress: () => answerQuestion(answer),
              );
            }), // Added `.toList()` for better performance
          ],
        ),
      ),
    );
  }
}
