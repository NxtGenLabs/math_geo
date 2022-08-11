import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/levelContainer.dart';
import '../level/trainingStation/training_station.dart';
import '../level/trainingStation/transforms/reflection.dart';
import '../level/trainingStation/transforms/rotate.dart';
import '../level/trainingStation/transforms/translate.dart';
import '../level/trainingStation/transforms/enlarge.dart';

class TrainingStationLevel extends StatelessWidget {
  TrainingStationLevel({Key? key}) : super(key: key);

  final List<Levels> levels = [
    Levels(level: '1', levelRoute: const TrainingStation()),
    Levels(level: '2', levelRoute: Reflection()),
    Levels(level: '3', levelRoute: Rotate()),
    Levels(level: '4', levelRoute: const Translate()),
    Levels(level: '5', levelRoute: Enlarge()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/training_station.png"))),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(
                                    Icons.chevron_left), iconSize: 40)
                                ],
                              ),
                            ),
                  ],
                ),
                const Text("Training Station", style: ThemeText.levelHeader),
              ],
            ),
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
                        child: Text(
                          "Level Select",
                          style: ThemeText.header2,
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                            itemCount: levels.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 4,
                                    childAspectRatio: .7),
                            itemBuilder: (context, index) {
                              return LevelContainer(
                                  onPress: () => Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return levels[index].levelRoute;
                                      })),
                                  level: levels[index].level);
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
