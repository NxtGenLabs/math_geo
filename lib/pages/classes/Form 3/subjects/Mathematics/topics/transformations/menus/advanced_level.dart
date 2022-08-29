import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/widgets/title.dart';

import '../../../../../../../../themes/textStyles.dart';
import '../../../../../../../../widgets/levelContainer.dart';

class AdvancedLevel extends StatelessWidget {
  List<AdvancedLs> levels = [
    AdvancedLs(
        level: '1',
        question: 'Rotate the triangle 90 degrees clockwise about the origin',
        answer: [const Offset(2, -1), const Offset(3, -3), const Offset(1, -2)],
        hint:
            'Subtract the shape`s angle by 90 to get the image`s corresponding angle.',
        timeLimit: 120,
        target: -90,
        qPoints: [const Offset(1, 2), const Offset(3, 3), const Offset(2, 1)]),
    AdvancedLs(
        level: '2',
        question:
            'Rotate the parallelogram 70 degrees clockwise about the origin.',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: -70,
        qPoints: [
          const Offset(-2, -1),
          const Offset(0, -3),
          const Offset(-3, -4),
          const Offset(-5, -2)
        ]),
    AdvancedLs(
        level: '3',
        question: 'Rotate the trapezium 180 degrees about the origin.',
        answer: [],
        hint:
            'Subtract the angle of each line on the trapezium by 180 and draw your points accordingly.',
        timeLimit: 120,
        target: -180,
        qPoints: [
          const Offset(0, 0),
          const Offset(1, 2),
          const Offset(3, 2),
          const Offset(4, 0)
        ]),
    AdvancedLs(
        level: '4',
        question: ' Rotate this shape 180° about the origin.',
        answer: [
          const Offset(-4, 2),
          const Offset(-3, 4),
          const Offset(-1, 2),
          const Offset(-3, 1)
        ],
        hint: '',
        timeLimit: 120,
        target: -180,
        qPoints: [
          const Offset(-4, 2),
          const Offset(-3, 4),
          const Offset(-1, 2),
          const Offset(-3, 1)
        ]),
    AdvancedLs(
        level: '5',
        question:
            'Rotate the square 90 degrees anit-clockwise about the origin.',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: [
          const Offset(2, 2),
          const Offset(5, 2),
          const Offset(5, 4),
          const Offset(2, 4)
        ]),
    AdvancedLs(
        level: '6',
        question:
            'Rotate the shape 90 degrees anti-clockwise about the origin.',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: [
          const Offset(5, 1),
          const Offset(2, 1),
          const Offset(2, 3),
          const Offset(4, 3)
        ]),
    AdvancedLs(
        level: '7',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '8',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '9',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '10',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '11',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '12',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '13',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '14',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '15',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '16',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '17',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '18',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '19',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '20',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '21',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '22',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '23',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '24',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '25',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '26',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '27',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '28',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '29',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: []),
    AdvancedLs(
        level: '30',
        question: '',
        answer: [],
        hint: '',
        timeLimit: 120,
        target: 90,
        qPoints: [])
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
                          tag: 'world-images/city.png',
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("images/city.png")),
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
                const AnimatedTitle(title: "The City")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: height / 1.4,
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
                                  onPress: () => Navigator.pushNamed(context,
                                      './pages/topics/transformations/level/advanced',
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

class AdvancedLs {
  String level;
  String question;
  String hint;
  int timeLimit;
  int target;
  List<Offset> qPoints;
  List<Offset> answer;

  AdvancedLs(
      {required this.level,
      required this.question,
      required this.answer,
      required this.hint,
      required this.target,
      required this.timeLimit,
      required this.qPoints});
}
