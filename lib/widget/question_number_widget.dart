import 'package:flutter/material.dart';
import 'package:quiz_app_example/model/question.dart';

class QuestionNumberWidget extends StatelessWidget {
  final List<Question> questions;
  final Question question;
  final ValueChanged<int> onClickedNumber;
  const QuestionNumberWidget(
      {Key key,
      @required this.questions,
      @required this.question,
      @required this.onClickedNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double padding = 16;

    return Container(
      height: 50,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: padding),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Container(
          width: padding,
        ),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final isSelected = question == questions[index];

          return buildNumber(index: index, isSelected: isSelected);
        },
      ),
    );
  }

  Widget buildNumber({int index, bool isSelected}) {
    final color = isSelected ? Colors.cyan.shade300 : Colors.white;

    return GestureDetector(
      onTap: () => onClickedNumber(index),
      child: CircleAvatar(
        backgroundColor: color,
        child: Text(
          '${index + 1}',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
