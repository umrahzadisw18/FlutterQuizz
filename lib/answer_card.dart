import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String question;
  final bool isSelected;
  final int currentIndex;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;

  AnswerCard(
      {super.key,
      required this.question,
      required this.isSelected,
      required this.currentIndex,
      this.correctAnswerIndex,
      this.selectedAnswerIndex});

  @override
  Widget build(BuildContext context) {
    bool iscorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !iscorrectAnswer && isSelected;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: selectedAnswerIndex != null
          ? Container(
              height: 70,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: iscorrectAnswer
                          ? Colors.green
                          : isWrongAnswer
                              ? Colors.red
                              : Colors.white24)),
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                    child: Text(
                      question,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
                    SizedBox(
                    height: 10,
                  ),
                  iscorrectAnswer
                      ? buildCorrectIcon()
                      : isWrongAnswer
                          ? buildWrongIcon()
                          : SizedBox.shrink(),
                ],
              ),
            )
          : Container(
              height: 70,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white24)),
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                    child: Text(
                      question,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
                
                ],
              ),
            ),
    );
  }
}

Widget buildCorrectIcon() => CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
