import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/levelContainer.dart';
import '../level/trainingStation/training_station.dart';
import '../level/trainingStation/transforms/rotate.dart';
import '../level/trainingStation/transforms/translate.dart';
import '../level/trainingStation/transforms/enlarge.dart';

class TrainingStationLevel extends StatelessWidget {
  TrainingStationLevel({Key? key}) : super(key: key);

  final List<Levels> levels = [
    Levels(level: '1', levelRoute: const TrainingStation()),
    Levels(level: '2', levelRoute: Rotate()),
    Levels(level: '3', levelRoute: const Translate()),
    Levels(level: '4', levelRoute: Enlarge()),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                        width: width,
                        height: height / 2.5,
                        child: const Hero(
                          tag: 'world-images/training_station.png',
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("images/training_station.png")),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () async {
                                final player = AudioPlayer();
                                await player
                                    .play(AssetSource('satisfying_click.wav'));
                                Navigator.pop(context);
                              },
                              color: const Color.fromARGB(255, 248, 252, 246),
                              icon: const Icon(
                                FontAwesomeIcons.chevronLeft,
                              ),
                              iconSize: 30),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 204, 205, 251)),
                            child: const Text("Form 3", style: ThemeText.world),
                          )
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
                  height: height / 1.3,
                  width: width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(50),
                          topEnd: Radius.circular(50))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          "Level Select",
                          style: ThemeText.header2,
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                            itemCount: levels.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: width ~/ 180,
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
