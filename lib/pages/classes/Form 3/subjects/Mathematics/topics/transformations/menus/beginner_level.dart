import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';

import '../../../../../../../../widgets/levelContainer.dart';

class BeginnerLevel extends StatelessWidget {
  List<BeginnerLs> levels = [
    BeginnerLs(
        level: '1',
        question:
            'Given the 2 shapes, what scale factor the shape has been enlarged by. \n A. 2 \n B. 1.5 \n C. 2.5',
        rating: '',
        answer: 'B',
        hint: 'Find the coordinates of the two shapes, then divide each point by the other.',
        timeLimit: 120,
        qPoints: [
          const Offset(-1, 1),
          const Offset(-4, 1),
          const Offset(-4, 3)
        ],
        optionA: [
          const Offset(-2, 2),
          const Offset(-8, 2),
          const Offset(-8, 6)
        ],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '2',
        question:
            'Find the scale factor of the enlargement given that the center is the point of enlargement. \n A. 2.5 \n B. 3 \n C. 1.5',
        rating: '',
        answer: 'C',
        hint: 'Lets keep putting up points',
        timeLimit: 120,
        qPoints: [
          const Offset(0, 0),
          const Offset(0, 2),
          const Offset(2, 2),
          const Offset(2, 0),
        ],
        optionA: [
          const Offset(0, 0),
          const Offset(0, 5),
          const Offset(5, 5),
          const Offset(5, 0),
        ],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '3',
        question:
            'Find the scale factor of the enlargement given that the center is the point of enlargement. \n A. 2.5 \n B. 3 \n C. 1.5',
        rating: '',
        answer: 'C',
        hint: 'Lets keep putting up points',
        timeLimit: 120,
        qPoints: [
          const Offset(1, 1),
          const Offset(4, 3),
          const Offset(1, 3)
        ],
        optionA: [
          const Offset(1.5, 1.5),
          const Offset(6, 4.5),
          const Offset(1.5, 4.5)
        ],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '4',
        question:
            'By what factor has the shape been translated by? \n A. (6, 6) \n B. (-6, 6) \n C. (6, 3)',
        rating: '',
        answer: 'A',
        hint: 'Lets keep putting up points',
        timeLimit: 120,
        qPoints: [
          const Offset(-1, -1),
          const Offset(-4, -1),
          const Offset(-4, -4),
          const Offset(-1, -4)
        ],
        optionA: [
          const Offset(5, 5),
          const Offset(2, 5),
          const Offset(2, 2),
          const Offset(5, 2)
        ],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '5',
        question:
            'For the transformation shown at the right, what is the measure of the angle of rotation of ABCD about the origin? \n A. 90º \n B. 180º \n C. 270º',
        rating: '',
        answer: 'A',
        hint: 'Lets keep putting up points',
        timeLimit: 120,
        qPoints: [
          const Offset(1, 2),
          const Offset(6, 2),
          const Offset(8, 6),
          const Offset(3, 6)
        ],
        optionA: [
          const Offset(2, -1),
          const Offset(2, -6),
          const Offset(6, -8),
          const Offset(6, -3)
        ],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '6',
        question:
            'ΔRST has R(-2,-2), S(3,5) and T(7,-4). What is the image of point T after a rotation of 180º about the origin? \n A.T  (-7,-4) \n B. T  (7,4) \n C. T  (-7,4)',
        rating: '',
        answer: 'C',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [
          const Offset(-2, -2),
          const Offset(3, 5),
          const Offset(7, -4)
        ],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '7',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '8',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '9',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '10',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '11',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '12',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '13',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '14',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '15',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '16',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '17',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '18',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '19',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '20',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '21',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '22',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '23',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '24',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '25',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '26',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '27',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '28',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '29',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '30',
        question: '',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [],
        optionA: [],
        optionB: [],
        optionC: [])
  ];

  BeginnerLevel({Key? key}) : super(key: key);

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
                        child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/the_field.png"))),
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
                                color: Color.fromARGB(255, 106, 117, 21)),
                            child: const Text("Transformations",
                                style: ThemeText.world),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Text("The Field", style: ThemeText.levelHeader),
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
                        child: Text("Level Select", style: ThemeText.header2),
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
                                      './pages/topics/transformations/level/beginner',
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

class BeginnerLs {
  String level;
  String question;
  String rating;
  String answer;
  String hint;
  int timeLimit;
  List<Offset> qPoints;
  List<Offset> optionA;
  List<Offset> optionB;
  List<Offset> optionC;

  BeginnerLs(
      {required this.level,
      required this.question,
      required this.rating,
      required this.answer,
      required this.hint,
      required this.timeLimit,
      required this.qPoints,
      required this.optionA,
      required this.optionB,
      required this.optionC});
}
