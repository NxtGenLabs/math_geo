import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

import '../../../../../../../../widgets/levelContainer.dart';
import '../../../../../../../../widgets/option.dart';

class TransFormationsLevels extends StatelessWidget {
  List<IntermediateLs> levels = [
    IntermediateLs(
        level: '1',
        question: 'Rotate the triangle 45 degrees about the vertex A',
        rating: '3/3',
        answer: [
          const Offset(100, 100),
          const Offset(400, 100),
          const Offset(450, 200)
        ],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '2',
        question:
            'Dont get too cocky, my grandma got to this level faster than you did',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '3',
        question: 'Impressive, but i still think you can flunk the exam pssstt',
        rating: '3/3',
        answer: [],
        qPoints: [],
        hint: '',
        timeLimit: 120),
    IntermediateLs(
        level: '4',
        question:
            'Draw the image of square ABDC when it is rotated 270 degrees about O. Find the coordinates of E` F` and G`',
        rating: '3/3',
        answer: [],
        qPoints: [],
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
