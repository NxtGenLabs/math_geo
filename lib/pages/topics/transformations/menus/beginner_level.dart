import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/option.dart';

class BeginnerLevel extends StatelessWidget {
  List<BeginnerLs> levels = [
    BeginnerLs(
        level: '1',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [Offset(1200, 100), Offset(1000, 100), Offset(1000, 300)],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '2',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '3',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '4',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '5',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '6',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '7',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '8',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '9',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '10',
        question: '',
        rating: '',
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: [])
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      height: double.infinity,
      width: double.infinity,
      child: GridView.builder(
          itemCount: levels.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height)),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Option(
                text: 'Level ${levels[index].level}',
                route: () => Navigator.pushNamed(
                    context, './pages/topics/transformations/level/beginner'),
              ),
            );
          }),
    );
  }
}

class BeginnerLs {
  String level;
  String question;
  String rating;
  List qPoints;
  List optionA;
  List optionB;
  List optionC;

  BeginnerLs(
      {required this.level,
      required this.question,
      required this.rating,
      required this.qPoints,
      required this.optionA,
      required this.optionB,
      required this.optionC});
}
