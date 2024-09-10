import 'package:dart_quiz/model/question_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['chosen_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 182, 199, 207),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['chosen_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 20, 4, 236),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['correct_answer'] as String,
                style: const TextStyle(
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
