import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/customAppbar.dart';
import 'package:math_geometry/widgets/toolbar.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:math_geometry/canvas/grid.dart';
import 'package:math_geometry/canvas/painter.dart';
import '../menus/intermediate_level.dart';

class Intermediate extends StatefulWidget {
  const Intermediate({Key? key}) : super(key: key);

  @override
  State<Intermediate> createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  late GestureDetector touch;
  late CustomPaint canvas;
  late LinePainter linePainter;
  double _scale = 1.0;
  final double _previousScale = 1.0;

  void onPanStart(DragStartDetails details) {
    linePainter.startStroke(details.localPosition);
  }

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final level = ModalRoute.of(context)!.settings.arguments as IntermediateLs;
    linePainter = LinePainter(int.parse(level.level) - 1);

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          GestureDetector(
            // onScaleStart: (ScaleStartDetails details) {
            //   _previousScale = _scale;
            //   setState(() {});
            // },
            // onScaleUpdate: (ScaleUpdateDetails details) {
            //   _scale = _previousScale * details.scale;
            // },
            // onScaleEnd: (ScaleEndDetails details) {
            //   _previousScale = 1.0;
            //   setState(() {});
            // },
            onPanStart: onPanStart,
            child: RepaintBoundary(
              child: Container(
                  color: Colors.white,
                  height: double.infinity,
                  width: double.infinity,
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform:
                        Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
                    child: CustomPaint(
                      foregroundPainter: linePainter,
                      child: Visibility(
                        visible: isVisible,
                        child: const MyGrid(),
                      ),
                    ),
                  )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(
                  offsets: linePainter.points,
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
                  delete: () => linePainter.deletePoint()),
            ],
          ),
        ],
      ),
    );
  }
}
