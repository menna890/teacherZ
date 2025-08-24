// import 'package:flutter/material.dart';
// import 'answer_button.dart';

// class QuestionCard extends StatelessWidget {
//   final String question;
//   final List<String> answers;
//   final String? selectedAnswer;
//   final Function(String, String) onAnswerSelected;

//   const QuestionCard({
//     super.key,
//     required this.question,
//     required this.answers,
//     required this.selectedAnswer,
//     required this.onAnswerSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final bool isDesktop = MediaQuery.of(context).size.width > 800;
//     return Container(
//       padding: EdgeInsets.all(isDesktop ? 20 : 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(isDesktop ? 16 : 12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.purple.withOpacity(0.1),
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             question,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.purple.shade900,
//             ),
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//           ),
//           SizedBox(height: 12),
//            ListView.builder(
//               shrinkWrap: true,
//               itemCount: answers.length,
//               itemBuilder: (context, index) {
//                 final answer = answers[index];
//                 return AnswerButton(
//                   question: question,
//                   answer: answer,
//                   isSelected: selectedAnswer == answer,
//                   onAnswerSelected: onAnswerSelected,
//                 );
//               },
//             ),

//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final List<String> answers;
  final String? selectedAnswer;
  final Function(String, String) onAnswerSelected;

  const QuestionCard({
    super.key,
    required this.question,
    required this.answers,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.purple.shade900,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 12),
          // ListView with shrinkWrap and no scrolling physics to remove extra space
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children:
                  answers.map((answer) {
                    return _buildAnswerButton(question, answer);
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(String question, String answer) {
    final bool isSelected = selectedAnswer == answer;

    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: () => onAnswerSelected(question, answer),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.purple : Colors.grey.shade200,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
