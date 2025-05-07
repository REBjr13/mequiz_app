import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 350,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 60),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.eczar(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 60),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(19, 172, 164, 164),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            ),
            onPressed: () => startQuiz(),
            icon: const Icon(Icons.start_sharp, color: Colors.white),

            label: Text(
              "Start Quiz",
              style: GoogleFonts.kadwa(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
