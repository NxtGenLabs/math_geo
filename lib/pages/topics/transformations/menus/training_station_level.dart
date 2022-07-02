import 'package:flutter/material.dart';
import '../../../../widgets/option.dart';

class TrainingStationLevels extends StatelessWidget {
  TrainingStationLevels({Key? key}) : super(key: key);

  final List<Levels> transforms = [
    Levels(level: 'Reflection', question: 'Rotate the triangle 45 degrees about the vertex A', rating: '3/3', qPoints: []),
    Levels(level: 'Rotate', question: 'Rotate the triangle 45 degrees about the vertex A', rating: '3/3', qPoints: []),
    Levels(level: 'Translate', question: 'Rotate the triangle 45 degrees about the vertex A', rating: '3/3', qPoints: []),
    Levels(level: 'Enlarge', question: 'Rotate the triangle 45 degrees about the vertex A', rating: '3/3', qPoints: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: GridView.builder(
          itemCount: transforms.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height)),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Option(
                text: transforms[index].level,
                route: () => Navigator.pushNamed(context, './pages/topics/transformations/levels/training_station', arguments: transforms[index]),
              ),
            );
          }),
    );
  }
}

// levels construct
class Levels {
  String level;
  String question;
  String rating;
  List qPoints;

  Levels({required this.level, required this.question, required this.rating, required this.qPoints});
}
