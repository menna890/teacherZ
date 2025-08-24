import 'package:flutter/material.dart';
import 'package:teacherz/data/userinformations.dart';
import 'question_card.dart';
import 'checkbox_card.dart';

class QuestionsGrid extends StatelessWidget {
  final Map<String, String?> selectedAnswers;
  final Map<String, bool> checkboxAnswers;
  final Function(String, String) onAnswerSelected;
  final Function(String, bool?) onCheckboxChanged;

  const QuestionsGrid({
    super.key,
    required this.selectedAnswers,
    required this.checkboxAnswers,
    required this.onAnswerSelected,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Expanded(
      child:
          isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.2,
        ),
        itemCount: userInformation.length + 1,
        itemBuilder: (context, index) => _buildGridItem(context, index),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: userInformation.length + 1,
      itemBuilder: (context, index) => _buildGridItem(context, index),
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    if (index < userInformation.length) {
      final question = userInformation.keys.elementAt(index);
      final answers = userInformation[question]!;
      return QuestionCard(
        question: question,
        answers: answers,
        selectedAnswer: selectedAnswers[question],
        onAnswerSelected: onAnswerSelected,
      );
    } else {
      return CheckboxCard(
        question: checkboxAnswers.keys.first,
        isChecked: checkboxAnswers[checkboxAnswers.keys.first] ?? false,
        onCheckboxChanged: onCheckboxChanged,
      );
    }
  }
}