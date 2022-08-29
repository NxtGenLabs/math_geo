import 'package:flutter/material.dart';
// user defiend imports
import 'package:math_geometry/canvas/grid.dart';

import 'package:math_geometry/widgets/appbars/custom_appbar.dart';
import 'package:math_geometry/widgets/customDialog.dart';

class TrainingStation extends StatefulWidget {
  const TrainingStation({Key? key}) : super(key: key);

  @override
  _TrainingStationState createState() => _TrainingStationState();
}

class _TrainingStationState extends State<TrainingStation> {
  //!
  List<CustomDialog> returnTutorials() {
    List<CustomDialog> tutorial = [
      CustomDialog(
        title: 'title1',
        clsBtnTitle: 'Next',
        message: 'message',
        attempt: false,
        header: Icons.lightbulb_circle_outlined,
        headerColor: Colors.yellow,
        onClsBtnPressed: () => Navigator.of(context).pop(),
      ),
      CustomDialog(
        title: 'title2',
        clsBtnTitle: 'Next',
        message: 'message',
        attempt: false,
        header: Icons.lightbulb_circle_outlined,
        headerColor: Colors.yellow,
        onClsBtnPressed: () => Navigator.of(context).pop(),
      ),
      CustomDialog(
        title: 'title3',
        clsBtnTitle: 'Done.',
        message: 'message',
        attempt: false,
        header: Icons.lightbulb_circle_outlined,
        headerColor: Colors.yellow,
        onClsBtnPressed: () => Navigator.of(context).pop(),
      ),
    ];
    return tutorial;
  }

  int tutorialIndex = 0;
  late List<CustomDialog> tutorial = returnTutorials();

  void showTutorial(List arr, int index) async {
    if (index >= arr.length) {
      return;
    }
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return arr[index];
      }, /*dialog code here with arr[index]*/
    );
    showTutorial(arr, index + 1);
  }

  @override
  void initState() {
    super.initState();
    // showTutorial(tutorial, tutorialIndex); // may need a future method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: Colors.grey[400],
            child: CustomPaint(
              painter: MyGridPainter(),
              child: Container(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAppBar(
                pick: '',
                level: '',
                question: '',
                answer: '',
                hint: '',
                timeLimit: 0,
                onUpdateScore: () {},
                score: 0,
              )
            ],
          )
        ]),
      ),
    );
  }
}
