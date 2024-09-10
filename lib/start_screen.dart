import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/dartlogo2.png',
            width: 300,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Learn Dart the easy way!",
            style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 236, 228, 228), fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 236, 228, 228),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
