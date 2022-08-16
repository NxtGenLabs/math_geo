import 'package:flutter/material.dart';
import 'package:math_geometry/canvas/grid.dart';
import 'package:math_geometry/canvas/multipleChoiceQs.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/menus/beginner_level.dart';
import 'package:math_geometry/widgets/multipleChoiceOptions.dart';
import 'package:math_geometry/widgets/customAppbar.dart';

class Beginner extends StatefulWidget {
  @override
  State<Beginner> createState() => _BeginnerState();
}

class _BeginnerState extends State<Beginner> {
  String pick = '';
  int score = 0;

  @override
  Widget build(BuildContext context) {
    final level = ModalRoute.of(context)!.settings.arguments as BeginnerLs;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Stack(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage("images/dummy_field.png"))),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    foregroundPainter: MultipleChoiceQs(
                      int.parse(level.level) - 1,
                    ),
                    child: const Visibility(
                      child: MyGrid(),
                    ),
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(level.level, level.question, level.answer, pick,
                  level.hint, score, () {}, level.timeLimit),
              MultipleChoiceOptions(pick, (String val) {
                setState(() {
                  pick = val;
                });
              }),
            ],
          )
        ],
      ),
    );
  }
}
