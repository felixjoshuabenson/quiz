import 'package:dart_quiz/model/question_summary.dart';
import 'package:dart_quiz/model/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });

  final List<String> chosenAnswer;
  final Function() onRestart;

  List<Map<String, Object>> get summaryInfo {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'chosen_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryItem = summaryInfo;
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswers = summaryItem.where(
      (data) {
        return data['chosen_answer'] == data['correct_answer'];
      },
    ).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You have answered $numberOfCorrectAnswers out of $numberOfTotalQuestions questions correctly!',
          style: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 131, 165, 224),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        QuestionSummary(
          summaryItem,
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton.icon(
          onPressed: onRestart,
          icon: const Icon(
            Icons.restart_alt_rounded,
            color: Colors.white,
          ),
          label: const Text(
            'Restart Quiz',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
