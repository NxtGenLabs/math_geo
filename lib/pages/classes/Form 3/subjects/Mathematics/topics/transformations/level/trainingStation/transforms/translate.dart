import 'package:flutter/material.dart';
import 'dart:math' as math;
// user defined imports
import 'package:math_geometry/canvas/grid.dart';
import 'package:math_geometry/themes/textStyles.dart';

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
    double centerX = MediaQuery.of(context).size.width / 2;
    double centerY = MediaQuery.of(context).size.height / 2;
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color.fromARGB(255, 60, 64, 50)),
                width: 350,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            'X',
                            style: ThemeText.world,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            thumbColor:
                                const Color.fromARGB(255, 217, 217, 217),
                            label: ((_moveShapeByY / 10).round()).toString(),
                            value: _moveShapeByY,
                            min: -MediaQuery.of(context).size.width / 2.5,
                            max: MediaQuery.of(context).size.width / 2.5,
                            onChanged: (value) {
                              setState(() {
                                _moveShapeByY = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            'Y',
                            style: ThemeText.world,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            thumbColor:
                                const Color.fromARGB(255, 217, 217, 217),
                            label: ((_moveShapeByX / 10).round()).toString(),
                            value: _moveShapeByX,
                            min: -MediaQuery.of(context).size.height / 3,
                            max: MediaQuery.of(context).size.height / 3,
                            onChanged: (value) {
                              setState(() {
                                _moveShapeByX = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
            pick: '',
            level: '- Translation.',
            question:
                'Translation is the moving a shape without rotating or flipping it.',
            answer: '',
            hint:
                'Drag the sliders below to translate the shape along an axis.',
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
      ..color = const Color.fromARGB(255, 96, 102, 92)
      ..strokeWidth = 3
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
