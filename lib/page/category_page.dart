import 'package:flutter/material.dart';
import 'package:quiz_app_example/model/category.dart';
import 'package:quiz_app_example/model/option.dart';
import 'package:quiz_app_example/model/question.dart';
import 'package:quiz_app_example/widget/question_number_widget.dart';
import 'package:quiz_app_example/widget/questions_widget.dart';

class CategoryPage extends StatefulWidget {
  final Category category;

  CategoryPage({Key key, @required this.category}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  PageController controller;
  Question question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.category.questions.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: QuestionsWidget(
          category: widget.category,
          controller: controller,
          onChangedPage: (index) => nextQuestion(index: index, jump: true),
          onClickedOption: selectOption,
        ),
      );

  void selectOption(Option option) {
    if (question.isLocked) {
      return;
    } else {
      setState(() {
        question.isLocked = true;
        question.selectedOption = option;
      });
    }
  }

  void nextQuestion({int index, bool jump = false}) {
    final nextPage = controller.page + 1;
    final indexPage = index ?? nextPage.toInt();

    setState(() {
      question = widget.category.questions[indexPage];
    });

    if (jump) {
      controller.jumpToPage(indexPage);
    }
  }

  Widget buildAppBar(BuildContext context) => AppBar(
        title: Text(widget.category.categoryName),
        actions: [
          Icon(Icons.filter_alt_outlined),
          SizedBox(
            width: 16,
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: QuestionNumberWidget(
              questions: widget.category.questions,
              question: question,
              onClickedNumber: (index) =>
                  nextQuestion(index: index, jump: true),
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.deepPurple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      );
}
