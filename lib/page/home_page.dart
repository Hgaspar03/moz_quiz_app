import 'package:flutter/material.dart';
import 'package:moz_quiz_app/data/categories.dart';
import 'package:moz_quiz_app/page/category_page.dart';
import 'package:moz_quiz_app/widget/category_detail_widget.dart';
import 'package:moz_quiz_app/widget/category_widget.dart';

class Homepage extends StatelessWidget {
  final String username = 'Helenio';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          elevation: 0,
          title: Text('Moz Quiz'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: buildWellCome(username),
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
          actions: [
            Icon(Icons.search),
            SizedBox(
              width: 12,
            )
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(
              height: 8,
            ),
            buildcategories(),
            buildPopular(context),
          ],
        ),
      );

  buildWellCome(String username) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Olá',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            username,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      );

  Widget buildcategories() => Container(
        height: 320,
        child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          children: categories
              .map(
                (category) => CategoryHeaderWidget(
                  category: category,
                ),
              )
              .toList(),
        ),
      );
}

Widget buildPopular(BuildContext context) => Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Popular',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 240,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: categories
                .map(
                  (category) => CategoryDetailWidget(
                    category: category,
                    onSelectedCategory: (category) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(
                            category: category,
                          ),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
