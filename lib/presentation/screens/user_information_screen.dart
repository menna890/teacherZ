import 'package:flutter/material.dart';
import 'package:teacherz/data/userinformations.dart';
import 'package:teacherz/presentation/widget/questionswidgets/questions_grid.dart';
import 'package:teacherz/presentation/widget/questionswidgets/submit_button.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final Map<String, String?> selectedAnswers = {};
  final Map<String, bool> checkboxAnswers = {
    "Do you want notifications to remind you about lessons?": false,
  };

  @override
  void initState() {
    super.initState();
    _initializeSelectedAnswers();
  }

  void _initializeSelectedAnswers() {
    for (var question in userInformation.keys) {
      selectedAnswers[question] = null;
    }
  }

  void _handleAnswerSelection(String question, String answer) {
    setState(() {
      selectedAnswers[question] = answer;
    });
  }

  void _handleCheckboxChange(String question, bool? value) {
    setState(() {
      checkboxAnswers[question] = value ?? false;
    });
  }

  void _submitForm() {
    if (!_validateForm()) return;
    _processFormData();
    _showSuccessMessage();
  }

  bool _validateForm() {
    bool allAnswered = true;
    List<String> unansweredQuestions = [];

    for (var question in userInformation.keys) {
      if (selectedAnswers[question] == null) {
        allAnswered = false;
        unansweredQuestions.add(question);
      }
    }

    if (!allAnswered) {
      _showIncompleteFormDialog();
      return false;
    }

    return true;
  }

  void _showIncompleteFormDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Incomplete Form'),
            content: Text('Please answer all questions before submitting.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  void _processFormData() {
    print('Selected Answers: $selectedAnswers');
    print('Checkbox: $checkboxAnswers');
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Preferences saved successfully!'),
        backgroundColor: Colors.purple,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color.fromARGB(255, 131, 84, 138), Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              QuestionsGrid(
                selectedAnswers: selectedAnswers,
                checkboxAnswers: checkboxAnswers,
                onAnswerSelected: _handleAnswerSelection,
                onCheckboxChanged: _handleCheckboxChange,
              ),
              SubmitButton(onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }
}
