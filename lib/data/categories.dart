import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moz_quiz_app/data/questions.dart';
import 'package:moz_quiz_app/model/category.dart';

final categories = <Category>[
  Category(
    questions: questions,
    categoryName: 'Physics',
    imageUrl: 'assets/physics.png',
    backgroundColor: Colors.cyan[700],
    icon: FontAwesomeIcons.rocket,
    description: 'Practice questions from various chapters in physics',
  ),
  Category(
    questions: questions,
    imageUrl: 'assets/chemistry.png',
    categoryName: 'Chemistry',
    backgroundColor: Colors.redAccent,
    icon: FontAwesomeIcons.atom,
    description: 'Practice questions from various chapters in chemistry',
  ),
  Category(
    questions: questions,
    imageUrl: 'assets/maths.png',
    categoryName: 'Maths',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
    description: 'Practice questions from various chapters in maths',
  ),
  Category(
    questions: questions,
    imageUrl: 'assets/biology.png',
    categoryName: 'Biology',
    backgroundColor: Colors.lightBlue,
    icon: FontAwesomeIcons.dna,
    description: 'Practice questions from various chapters in biology',
  ),
];
