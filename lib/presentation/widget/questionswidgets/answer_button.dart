import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String question;
  final String answer;
  final bool isSelected;
  final Function(String, String) onAnswerSelected;

  const AnswerButton({
    super.key,
    required this.question,
    required this.answer,
    required this.isSelected,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: () => onAnswerSelected(question, answer),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.purple : Colors.grey.shade200,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Text(
          answer,
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}