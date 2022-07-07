import 'package:flutter/material.dart';
import '../../../../widgets/option.dart';
import '../level/trainingStation/training_station.dart';
import '../level/trainingStation/transforms/reflection.dart';
import '../level/trainingStation/transforms/rotate.dart';
import '../level/trainingStation/transforms/translate.dart';
import '../level/trainingStation/transforms/enlarge.dart';

<<<<<<< HEAD
class TrainingStationLevels extends StatelessWidget {
  const TrainingStationLevels({Key? key}) : super(key: key);

=======
class TrainingStationLevel extends StatelessWidget {
  TrainingStationLevel({Key? key}) : super(key: key);

  final List<Levels> levels = [
    Levels(level: 'All In One', levelRoute: const TrainingStation()),
    Levels(level: 'Reflection', levelRoute: Reflection()),
    Levels(level: 'Rotation', levelRoute: Rotate()),
    Levels(level: 'Translation', levelRoute: Translate()),
    Levels(level: 'Enlargement', levelRoute: Enlarge()),
  ];
>>>>>>> 18cc1fb1448a178b3b5530e97ea0a5b596bb7488
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: GridView.builder(
<<<<<<< HEAD
          itemCount: 1,
=======
          itemCount: levels.length,
>>>>>>> 18cc1fb1448a178b3b5530e97ea0a5b596bb7488
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height)),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Option(
<<<<<<< HEAD
                text: 'Level',
                route: () => Navigator.pushNamed(context,
                    './pages/topics/transformations/level/training_station'),
=======
                text: levels[index].level,
                route: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return levels[index].levelRoute;
                })),
>>>>>>> 18cc1fb1448a178b3b5530e97ea0a5b596bb7488
              ),
            );
          }),
    );
  }
}

class Training {
  String level;
<<<<<<< HEAD
  String desc;

  Training(this.level, this.desc);
=======
  Widget levelRoute;
  Levels({required this.level, required this.levelRoute});
>>>>>>> 18cc1fb1448a178b3b5530e97ea0a5b596bb7488
}
