import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_geometry/canvas/advancedPainter.dart';
import 'package:math_geometry/widgets/appbars/custom_appbar.dart';
import 'package:math_geometry/canvas/grid.dart';

import '../../../../../../../../widgets/toolbar.dart';
import '../../../../../../../loading.dart';
import '../menus/advanced_level.dart';

class Advanced extends StatefulWidget {
  const Advanced({Key? key}) : super(key: key);

  @override
  State<Advanced> createState() => _AdvancedState();
}

class _AdvancedState extends State<Advanced> {
  late int targetDegrees;
  //
  late GestureDetector touch;
  late CustomPaint canvas;
  late GesturePainter gesturePainter;
  bool isVisible = true;
  double _scale = 1.0;
  final double _previousScale = 1.0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    targetDegrees = 0;
    gesturePainter = GesturePainter();
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void onPanStart(DragStartDetails details) {
    gesturePainter.startStroke(details.localPosition);
  }

  void onPanUpdate(DragUpdateDetails details) {
    gesturePainter.appendStroke(details.localPosition);
  }

  void onPanEnd(DragEndDetails details) {
    gesturePainter.endStroke();
  }

  @override
  Widget build(BuildContext context) {
    final level = ModalRoute.of(context)!.settings.arguments as AdvancedLs;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          GestureDetector(
            onPanStart: onPanStart,
            onPanUpdate: onPanUpdate,
            onPanEnd: onPanEnd,
            child: RepaintBoundary(
              child: Container(
                color: const Color.fromARGB(255, 199, 178, 153),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  foregroundPainter: gesturePainter,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(
                        begin: 0, end: targetDegrees * (pi / 180)),
                    duration: const Duration(seconds: 4),
                    curve: Curves.easeIn,
                    builder: (_, double angle, __) {
                      return CustomPaint(
                        painter: OriginalShapePainter(angle, level.qPoints),
                        child: const MyGrid(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(
                  retry: () {
                    setState(() {
                      targetDegrees = 0;
                    });
                  },
                  target: () {
                    setState(() {
                      targetDegrees = level.target;
                    });
                  },
                  pick: '',
                  offsets: gesturePainter.getPoints(),
                  level: level.level,
                  question: level.question,
                  answer: level.answer.toString(),
                  hint: level.hint,
                  score: 0,
                  onUpdateScore: () {},
                  timeLimit: level.timeLimit),
              ToolBar(
                  zoomIn: () {
                    _scale = _scale * 1.1;
                    setState(() {});
                  },
                  zoomOut: () {
                    if (_scale > 1.0) {
                      _scale = _scale / 1.1;
                    }
                    setState(() {});
                  },
                  onClick: () => setState(() {
                        isVisible = !isVisible;
                      }),
                  delete: () => gesturePainter.deletePoint()),
            ],
          ),
          Visibility(visible: isLoading, child: Loading())
        ],
      ),
    );
  }
}
