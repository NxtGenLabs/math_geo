import 'package:flutter/material.dart';
import 'dart:math' as math;
// user defined imports
import 'package:math_geometry/canvas/grid.dart';

import '../../../../../../../../../../widgets/customAppbar.dart';

class Enlarge extends StatefulWidget {
  @override
  _EnlargeState createState() => _EnlargeState();
}

class _EnlargeState extends State<Enlarge> {
  // positional variables
  final double _sides = 3;
  double _scale = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Expanded(
                  child: CustomPaint(
                    painter: MyGridPainter(),
                    foregroundPainter: enlargementPainter(_sides, _scale),
                    child: Container(),
                  ),
                ),
                // for the  enlargement slider

                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Center(
                          child: Text(
                            'Enlarge',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Slider(
                        value: _scale,
                        min: -MediaQuery.of(context).size.width / 15,
                        max: MediaQuery.of(context).size.width / 15,
                        onChanged: (value) {
                          setState(() {
                            _scale = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomAppBar(
                level: '',
                question: '',
                answer: '',
                hint: '',
                timeLimit: 0,
                onUpdateScore: () {},
                score: 0,
              )
            ])
          ],
        ),
      ),
    );
  }
}

// FOR PAINTING SHAPES
class enlargementPainter extends CustomPainter {
  // positional variables
  final double sides;
  final double scale;

  enlargementPainter(this.sides, this.scale);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 100 + scale;
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

    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));
    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + 0;
      double y = radius * math.sin(radians + angle * i) + 0;
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
