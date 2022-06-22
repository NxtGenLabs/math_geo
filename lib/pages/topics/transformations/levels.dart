import 'package:flutter/material.dart';
import '../../../widgets/option.dart';

class TransFormationsLevels extends StatelessWidget {
  List<Levels> levels = [
    Levels(
        level: '1',
        question: 'Rotate the triangle 45 degrees about the vertex A',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '2',
        question:
            'Dont get too cocky, my grandma got to this level faster than you did',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '3',
        question: 'Impressive, but i still think you can flunk the exam pssstt',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '4',
        question:
            'Draw the image of square ABDC when it is rotated 270 degrees about O. Find the coordinates of E` F` and G`',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '5',
        question: 'Rotate the triangle 20 degrees about the vertex A',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '6',
        question:
            'The parallelogram MNOP is rotated -90 degrees about S. Find the coordiantes of M`, N` O` and P`',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '7',
        question: 'Dude, im tired of asking questions ok',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '8',
        question: 'You aint gon make it to this level anyway lol',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '9',
        question: 'Ohh wow, props on proving me wrong',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '10',
        question:
            'Congratulations on wasting your valubale time on math youll never need anyway',
        rating: '3/3',
        qPoints: []),
    Levels(
        level: '11',
        question: 'Ok, now im impressed. You guarranteed to ace that exam bro',
        rating: '3/3',
        qPoints: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: GridView.builder(
          itemCount: levels.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height)),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Option(
                text: 'Level ${levels[index].level}',
                route: () => Navigator.pushNamed(
                    context, './pages/topics/transformations/main',
                    arguments: levels[index]),
              ),
            );
          }),
    );
  }
}

class Levels {
  String level;
  String question;
  String rating;
  List qPoints;

  Levels(
      {required this.level,
      required this.question,
      required this.rating,
      required this.qPoints});
}
