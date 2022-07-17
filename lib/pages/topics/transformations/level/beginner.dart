import 'package:flutter/material.dart';
import 'package:math_geometry/canvas/grid.dart';
import 'package:math_geometry/canvas/multipleChoiceQs.dart';
import 'package:math_geometry/pages/topics/transformations/menus/beginner_level.dart';
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
      floatingActionButton: MultipleChoiceOptions(pick, (String val ){
        setState(() {
          pick = val;
        });
      }),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
              color: Colors.grey[400],
              height: double.infinity,
              width: double.infinity,
              child: CustomPaint(
                foregroundPainter: MultipleChoiceQs(int.parse(level.level) - 1),
                child: Visibility(
                  child: const MyGrid(),
                ),
              )),
          CustomAppBar(level.level, level.question, level.answer, pick, level.hint, score, (){}, level.timeLimit)
        ],
      ),
    );
  }
}
