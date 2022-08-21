import 'package:flutter/material.dart';
import 'dart:math' as math;
// user defined imports
import 'package:math_geometry/canvas/grid.dart';

import '../../../../../../../../../../widgets/customAppbar.dart';

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  // positional variables
  final double _moveShapeByXY = 0.0;
  double _moveShapeByY = 0.0;
  double _moveShapeByX = 0.0;
  final double _sides = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Stack(
        children: <Widget>[
          Expanded(
            child: CustomPaint(
              painter: MyGridPainter(),
              foregroundPainter: translationPainter(
                  _moveShapeByXY, _moveShapeByY, _moveShapeByX, _sides),
              child: Container(),
            ),
          ),
          // for the yaxis slider
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('Move Shape Along X'),
              ),
              Slider(
                value: _moveShapeByY,
                min: -MediaQuery.of(context).size.width / 2.5,
                max: MediaQuery.of(context).size.width / 2.5,
                onChanged: (value) {
                  setState(() {
                    _moveShapeByY = value;
                  });
                },
              ),
              // for the  xaxis slider
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('Move Shape Along Y'),
              ),
              Slider(
                value: _moveShapeByX,
                min: -MediaQuery.of(context).size.height / 3,
                max: MediaQuery.of(context).size.height / 3,
                onChanged: (value) {
                  setState(() {
                    _moveShapeByX = value;
                  });
                },
              ),
            ],
          )
          // // for the  xy-axis slider
          // const Padding(
          //   padding: EdgeInsets.only(left: 16.0),
          //   child: Text('move by xy'),
          // ),
          // Slider(
          //   value: _moveShapeByXY,
          //   min: -MediaQuery.of(context).size.height / 3,
          //   max: MediaQuery.of(context).size.height / 3,
          //   onChanged: (value) {
          //     setState(() {
          //       _moveShapeByXY = value;
          //     });
          //   },
          // ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppBar(
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
    ])));
  }
}

// FOR PAINTING SHAPES
class translationPainter extends CustomPainter {
  // positional variables
  final double moveShapeByXY;
  final double moveShapeByY;
  final double moveShapeByX;
  final double sides;

  translationPainter(
      this.moveShapeByXY, this.moveShapeByY, this.moveShapeByX, this.sides);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 100;
    var radians = 0.0;
    var angle = (math.pi * 2) / sides;

    // screen's center
    Offset screenCenter = Offset(size.width / 2, size.height / 2);
    // translating entire canvas to ensure it behaves like a classical graph
    canvas.translate(screenCenter.dx, screenCenter.dy);
    canvas.scale(1, -1);

    // object paints and paths
    Paint ogPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path ogPath = Path();

    // shape Coordinates
    List<Offset> original = [];

    Offset startPoint = Offset(radius * math.cos(radians) + moveShapeByY,
        radius * math.sin(radians) + moveShapeByX);
    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + 0;
      double y = radius * math.sin(radians + angle * i) + 0;
      original.add(Offset(
          x + moveShapeByY + moveShapeByXY, y + moveShapeByX + moveShapeByXY));
    }
    ogPath.addPolygon(original, true);
    canvas.drawPath(ogPath, ogPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
