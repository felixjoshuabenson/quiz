import 'package:dart_quiz/summary_data.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryItem, {super.key});

  final List<Map<String, Object>> summaryItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: summaryItem.map((data) {
              return SummaryData(data);
            }).toList(),
          ),
        ));
  }
}
