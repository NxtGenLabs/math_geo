import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/option.dart';

import '../../../../../../../../widgets/levelContainer.dart';

class BeginnerLevel extends StatelessWidget {
  List<BeginnerLs> levels = [
    BeginnerLs(
        level: '1',
        question: 'Find the blah blah',
        rating: '',
        answer: 'B',
        hint: 'Lets keep putting up points',
        timeLimit: 120,
        qPoints: [
          const Offset(-100, -100),
          const Offset(-400, -100),
          const Offset(-450, -200)
        ],
        optionA: [
          const Offset(100, -100),
          const Offset(400, -100),
          const Offset(50, -200)
        ],
        optionB: [
          const Offset(100, 100),
          const Offset(400, 100),
          const Offset(50, 200)
        ],
        optionC: [
          const Offset(-100, 100),
          const Offset(-400, 100),
          const Offset(-450, 200)
        ]),
    BeginnerLs(
        level: '2',
        question:
            'How many degrees has the figure been rotated by? \n A. 180 Degrees. \n B. 90 degrees clockwise. \n C. 90 degrees anti-clockwise.',
        rating: '',
        answer: '',
        hint: 'Lets keep putting up points',
        timeLimit: 1,
        qPoints: [
          const Offset(-450, 150),
          const Offset(-200, 150),
          const Offset(-150, -80),
          const Offset(-450, -150)
        ],
        optionA: [
          const Offset(450, 150),
          const Offset(200, 150),
          const Offset(150, -80),
          const Offset(450, -150)
        ],
        optionB: [],
        optionC: []),
    BeginnerLs(
        level: '3',
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
        level: '4',
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
        level: '5',
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
        level: '6',
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
        optionC: [])
  ];

  BeginnerLevel({Key? key}) : super(key: key);

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
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage("images/math-set.jpg"))),
                const Text("The Field", style: ThemeText.levelHeader),
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
                        child: Text("Level Select", style: ThemeText.header2),
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
