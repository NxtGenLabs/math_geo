import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/option.dart';

class BeginnerLevel extends StatelessWidget {
  List<BeginnerLs> levels = [
    BeginnerLs(
        level: '1',
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
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height)),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Option(
                text: 'Level ${index + 1}',
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
