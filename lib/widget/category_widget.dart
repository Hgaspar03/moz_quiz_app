import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moz_quiz_app/model/category.dart';
import 'package:moz_quiz_app/page/category_page.dart';

class CategoryHeaderWidget extends StatelessWidget {
  final Category category;

  CategoryHeaderWidget({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryPage(category: category),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: category.backgroundColor,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                category.icon,
                color: Colors.white,
                size: 26,
              )
            ],
          ),
        ),
      );
}
