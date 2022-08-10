import 'package:flutter/material.dart';
import '../../../../../../../../widgets/option.dart';
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
    Levels(level: 'Translation', levelRoute: const Translate()),
    Levels(level: 'Enlargement', levelRoute: Enlarge()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage("images/math-set.jpg"))),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(50),
                          topEnd: Radius.circular(50))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Text("World Select"),
                      ),
                      Expanded(
                        child: GridView.builder(
                            itemCount: levels.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
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
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Levels {
  String level;
  Widget levelRoute;
  Levels({required this.level, required this.levelRoute});
}
