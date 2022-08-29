import 'package:flutter/material.dart';
import 'package:math_geometry/canvas/grid.dart';
import 'package:math_geometry/canvas/multipleChoiceQs.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/menus/beginner_level.dart';
import 'package:math_geometry/widgets/multipleChoiceOptions.dart';

import '../../../../../../../../widgets/appbars/fieldAppbar.dart';
import '../../../../../../../loading.dart';

class Beginner extends StatefulWidget {
  @override
  State<Beginner> createState() => _BeginnerState();
}

class _BeginnerState extends State<Beginner> {
  String pick = '';
  int score = 0;
  bool isLoading = true;

    void initState(){
    super.initState();
     Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isLoading = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    final level = ModalRoute.of(context)!.settings.arguments as BeginnerLs;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
              color: const Color.fromARGB(255, 151, 188, 98),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FieldAppBar(
                  pick: pick,
                  level: level.level,
                  question: level.question,
                  answer: level.answer,
                  hint: level.hint,
                  score: 0,
                  onUpdateScore: () {},
                  timeLimit: level.timeLimit),
              MultipleChoiceOptions(pick, (String val) {
                setState(() {
                  pick = val;
                });
              }),
            ],
          ),
          Visibility(visible: isLoading, child: Loading())
        ],
      ),
    );
  }
}
