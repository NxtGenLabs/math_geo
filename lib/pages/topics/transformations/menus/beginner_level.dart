import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/option.dart';

class BeginnerLevel extends StatelessWidget {
  List<BeginnerLs> levels = [
    BeginnerLs(
        level: '1',
        question: 'Find the blah blah',
        rating: '',
        answer: 'B',
        hint: 'Lets keep putting up points',
        timeLimit: 120,
        qPoints: [
          const Offset(-100, -100),
          const Offset(-400, -100),
          const Offset(-450, -200)
        ],
        optionA: [
          const Offset(100, -100),
          const Offset(400, -100),
          const Offset(50, -200)
        ],
        optionB: [
          const Offset(100, 100),
          const Offset(400, 100),
          const Offset(50, 200)
        ],
        optionC: [
          const Offset(-100, 100),
          const Offset(-400, 100),
          const Offset(-450, 200)
        ]),
    BeginnerLs(
        level: '2',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '3',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '4',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '5',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '6',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '7',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '8',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '9',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '10',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: [])
  ];

  BeginnerLevel({Key? key}) : super(key: key);

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
                    context, './pages/topics/transformations/level/beginner',
                    arguments: levels[index]),
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
  String answer;
  String hint;
  double timeLimit;
  List<Offset> qPoints;
  List<Offset> optionA;
  List<Offset> optionB;
  List<Offset> optionC;

  BeginnerLs(
      {required this.level,
      required this.question,
      required this.rating,
      required this.answer,
      required this.hint,
      required this.timeLimit,
      required this.qPoints,
      required this.optionA,
      required this.optionB,
      required this.optionC});
}
