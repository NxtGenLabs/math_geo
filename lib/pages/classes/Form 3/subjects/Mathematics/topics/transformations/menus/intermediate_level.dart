import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';

import '../../../../../../../../widgets/levelContainer.dart';

class TransFormationsLevels extends StatelessWidget {
  List<IntermediateLs> levels = [
    IntermediateLs(
        level: '1',
        question: 'Translate the shape by (4,2)',
        rating: '3/3',
        answer: [const Offset(0, 3), const Offset(0, 5), const Offset(3, 3)],
        qPoints: [
          const Offset(-4, 1),
          const Offset(-4, 3),
          const Offset(-1, 1)
        ],
        hint: 'Shift each point 2 units up and 4 units to the right.',
        timeLimit: 120),
    IntermediateLs(
        level: '2',
        question: 'Translate the rectangle by (5,-4)',
        rating: '3/3',
        answer: [
          const Offset(1, -4),
          const Offset(1, -2),
          const Offset(4, -2),
          const Offset(4, -4)
        ],
        qPoints: [
          const Offset(-4, 0),
          const Offset(-4, 2),
          const Offset(-1, 2),
          const Offset(-1, 0),
        ],
        hint: 'Shift each point 5 units to the right and 4 units down.',
        timeLimit: 120),
    IntermediateLs(
        level: '3',
        question: 'Translate the the rectangle by (-3,-4)',
        rating: '3/3',
        answer: [
          const Offset(-2, 0),
          const Offset(2, 0),
          const Offset(2, -3),
          const Offset(-2, -3)
        ],
        qPoints: [
          const Offset(1, 4),
          const Offset(5, 4),
          const Offset(5, 1),
          const Offset(1, 1)
        ],
        hint: 'Shift each point 4 units down and 3 units to the left.',
        timeLimit: 120),
    IntermediateLs(
        level: '4',
        question:
            'Enlarge the shape ABCD by scale factor 2, the centre of enlargement being the origin.',
        rating: '3/3',
        answer: [
          const Offset(2, 2),
          const Offset(2, 6),
          const Offset(8, 6),
          const Offset(8, 2)
        ],
        qPoints: [
          const Offset(1, 1),
          const Offset(1, 3),
          const Offset(4, 3),
          const Offset(4, 1)
        ],
        hint: 'Multiply each x-y coordinate by 2.',
        timeLimit: 120),
    IntermediateLs(
        level: '5',
        question:
            'Enlarge the shape by the scale factor of 2 given that the center is the origin.',
        rating: '3/3',
        answer: [
          const Offset(-2, 2),
          const Offset(-2, 6),
          const Offset(-8, 6),
          const Offset(-8, 2),
          const Offset(-4, 0)
        ],
        qPoints: [
          const Offset(-1, 1),
          const Offset(-1, 3),
          const Offset(-4, 3),
          const Offset(-4, 1),
          const Offset(-2, 0),
        ],
        hint: 'Multiply each x-y coordinate by 2.',
        timeLimit: 120),
    IntermediateLs(
        level: '6',
        question: 'Enlarge the shape by the factor of 1.5',
        rating: '3/3',
        answer: [const Offset(0, 0), const Offset(-6, 0), const Offset(-6, -3)],
        qPoints: [
          const Offset(0, 0),
          const Offset(-4, 0),
          const Offset(-4, -2)
        ],
        hint: 'The coordinates with zeros remain the same.',
        timeLimit: 120),
    IntermediateLs(
        level: '7',
        question: 'TBA Rotation.',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '8',
        question: 'TBA rotation.',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '9',
        question: 'TBA Rotation',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '10',
        question: 'Translate the letter by a factor of (2,6)',
        rating: '3/3',
        answer: [
          const Offset(-1, 2),
          const Offset(-1, 4),
          const Offset(1, 4),
          const Offset(1, 5),
          const Offset(-4, 5),
          const Offset(-4, 4),
          const Offset(-2, 4),
          const Offset(-2, 2)
        ],
        qPoints: [
          const Offset(-3, -4),
          const Offset(-3, -2),
          const Offset(-1, -2),
          const Offset(-1, -1),
          const Offset(-6, -1),
          const Offset(-6, -2),
          const Offset(-4, -2),
          const Offset(-4, -4)
        ],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '11',
        question: 'Translate shape by the factor (4,1).',
        rating: '3/3',
        answer: [
          const Offset(2, 2),
          const Offset(-1, 0),
          const Offset(0, -1),
          const Offset(1, 0),
          const Offset(3, -2),
          const Offset(5, -1)
        ],
        qPoints: [
          const Offset(-2, 1),
          const Offset(-5, -1),
          const Offset(-4, -2),
          const Offset(-3, -1),
          const Offset(-1, -3),
          const Offset(1, -2)
        ],
        hint: 'Shift each point 4 units left and 1 units up.',
        timeLimit: 120),
    IntermediateLs(
        level: '12',
        question: 'Translate shape by the factor (-9,6).',
        rating: '3/3',
        answer: [
          const Offset(-7, 2),
          const Offset(-7, 5),
          const Offset(-6, 4),
          const Offset(-5, 5),
          const Offset(-4, 4),
          const Offset(-3, 5),
          const Offset(-2, 4),
          const Offset(-1, 5),
          const Offset(-1, 2),
        ],
        qPoints: [
          const Offset(2, -4),
          const Offset(2, -1),
          const Offset(3, -2),
          const Offset(4, -1),
          const Offset(5, -2),
          const Offset(6, -1),
          const Offset(7, -2),
          const Offset(8, -1),
          const Offset(8, -4),
        ],
        hint: 'Shift each point 9 units left and 6 units up.',
        timeLimit: 120),
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
                            image: AssetImage("images/the_lake.png"))),
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
                              icon: const Icon(FontAwesomeIcons.chevronLeft),
                              iconSize: 30),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 244, 181, 168)),
                            child: const Text("Transformations",
                                style: ThemeText.world),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Text("The Lake", style: ThemeText.levelHeader),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height / 1.4,
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
                                  onPress: () => Navigator.pushNamed(context,
                                      './pages/topics/transformations/level/intermediate',
                                      arguments: levels[index]),
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

class IntermediateLs {
  String level;
  String question;
  String rating;
  String hint;
  int timeLimit;
  List<Offset> qPoints;
  List<Offset> answer;

  IntermediateLs(
      {required this.level,
      required this.question,
      required this.rating,
      required this.answer,
      required this.hint,
      required this.timeLimit,
      required this.qPoints});
}
