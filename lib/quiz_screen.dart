import 'package:dart_quiz/model/question_button.dart';
import 'package:dart_quiz/model/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          ...currentQuestion.shuffledAnswer.map(
            (answer) {
              return QuestionButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            },
          ),
        ],
      ),
    );
  }
}
