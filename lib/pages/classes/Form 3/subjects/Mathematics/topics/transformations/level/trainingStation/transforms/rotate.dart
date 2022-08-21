import 'package:flutter/material.dart';
import 'dart:math' as math;
// user defined imports
import 'package:math_geometry/canvas/grid.dart';

import '../../../../../../../../../../widgets/customAppbar.dart';

class Rotate extends StatefulWidget {
  @override
  _RotateState createState() => _RotateState();
}

class _RotateState extends State<Rotate> {
  // positional variables
  final double _sides = 4;
  final double _radius = 100;
  double _radians = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: const Color.fromARGB(255, 189, 239, 249),
            child: CustomPaint(
              foregroundPainter: rotationPainer(_sides, _radius, _radians),
              painter: MyGridPainter(),
              child: Container(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey,
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 10.0),
                      child: Text('Rotation'),
                    ),
                    Slider(
                      value: _radians,
                      min: 0.0,
                      max: math.pi,
                      onChanged: (value) {
                        setState(() {
                          _radians = value;
                          print("Its rotated: $_radians radians");
                        });
                      },
                    ),
                  ]),
                ),
              ],
            ),
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
        ]),
      ),
    );
  }
}

// FOR PAINTING SHAPES
class rotationPainer extends CustomPainter {
  // positional variables
  final double sides;
  final double radians;
  final double radius;
  rotationPainer(this.sides, this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
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

    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));
    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(-radians + angle * i) + 0;
      double y = radius * math.sin(-radians + angle * i) + 0;
      original.add(Offset(x, y));
    }
    ogPath.addPolygon(original, true);
    canvas.drawPath(ogPath, ogPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
