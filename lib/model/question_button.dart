import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Text(answerText),
    );
  }
}
