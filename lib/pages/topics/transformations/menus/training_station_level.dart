import 'package:flutter/material.dart';
import '../../../../widgets/option.dart';
import '../level/trainingStation/training_station.dart';
import '../level/trainingStation/transforms/reflection.dart';
import '../level/trainingStation/transforms/rotate.dart';
import '../level/trainingStation/transforms/translate.dart';
import '../level/trainingStation/transforms/enlarge.dart';

class TrainingStationLevel extends StatelessWidget {
  TrainingStationLevel({Key? key}) : super(key: key);

  final List<Levels> levels = [
    Levels(level: 'All In One', levelRoute: const TrainingStation()),
    Levels(level: 'Reflection', levelRoute: Reflection()),
    Levels(level: 'Rotation', levelRoute: Rotate()),
    Levels(level: 'Translation', levelRoute: Translate()),
    Levels(level: 'Enlargement', levelRoute: Enlarge()),
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
                text: levels[index].level,
                route: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return levels[index].levelRoute;
                })),
              ),
            );
          }),
    );
  }
}

class Levels {
  String level;
  Widget levelRoute;
  Levels({required this.level, required this.levelRoute});
}
