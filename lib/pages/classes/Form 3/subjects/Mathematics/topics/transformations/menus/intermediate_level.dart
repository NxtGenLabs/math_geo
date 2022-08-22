import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';

import '../../../../../../../../widgets/levelContainer.dart';

class TransFormationsLevels extends StatelessWidget {
  List<IntermediateLs> levels = [
    IntermediateLs(
        level: '1',
        question: 'Translate the shape by (4,4)',
        rating: '3/3',
        answer: [
          const Offset(-20.0, 8.0),
          const Offset(-20.0, 20.0),
          const Offset(0.0, 8.0)
        ],
        qPoints: [
          const Offset(-24, 4),
          const Offset(-24, 16),
          const Offset(-4, 4)
        ],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '2',
        question: 'Translate the rectangle by (5,-8)',
        rating: '3/3',
        answer: [
          const Offset(-11, -6),
          const Offset(-11, -8),
          const Offset(1, -8),
          const Offset(1, -6)
        ],
        qPoints: [
          const Offset(-16, 2),
          const Offset(-16, 16),
          const Offset(-4, 16),
          const Offset(-4, 2),
        ],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '3',
        question: 'Translate the the rectangle by (4,7)',
        rating: '3/3',
        answer: [
          const Offset(8, 23),
          const Offset(24, 23),
          const Offset(24, 11),
          const Offset(8, 11)
        ],
        qPoints: [
          const Offset(4, 16),
          const Offset(20, 16),
          const Offset(20, 4),
          const Offset(4, 4)
        ],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '4',
        question:
            'Find by calculation the co–ordinates of the image of ABCD if it is enlarged by scale factor 2, the centre of enlargement being the origin.',
        rating: '3/3',
        answer: [],
        qPoints: [
          const Offset(4, 4),
          const Offset(4, 16),
          const Offset(20, 16),
          const Offset(20, 4)
        ],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '5',
        question: 'Rotate the triangle 20 degrees about the vertex A',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '6',
        question:
            'The parallelogram MNOP is rotated -90 degrees about S. Find the coordiantes of M`, N` O` and P`',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '7',
        question: 'Dude, im tired of asking questions ok',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '8',
        question: 'You aint gon make it to this level anyway lol',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '9',
        question: 'Ohh wow, props on proving me wrong',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '10',
        question:
            'Congratulations on wasting your valubale time on math youll never need anyway',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '11',
        question: 'Ok, now im impressed. You guarranteed to ace that exam bro',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
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
