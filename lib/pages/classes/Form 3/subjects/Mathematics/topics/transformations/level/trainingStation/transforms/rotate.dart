import 'package:flutter/material.dart';
import 'dart:math' as math;
// user defined imports
import 'package:math_geometry/canvas/grid.dart';

import '../../../../../../../../../../widgets/appbars/trainingStationAppbar.dart';
import '../../../../../../../../../loading.dart';

class Rotate extends StatefulWidget {
  @override
  _RotateState createState() => _RotateState();
}

class _RotateState extends State<Rotate> {
  // positional variables
  final double _sides = 4;
  final double _radius = 100;
  double _radians = 0.0;
  bool isLoading = true;

      @override
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: const Color.fromARGB(255, 44, 120, 115),
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
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Color.fromARGB(255, 60, 64, 50)),
                  width: 350,
                  child: Column(children: [
                    Slider(
                      thumbColor: const Color.fromARGB(255, 217, 217, 217),
                      label: '${(_radians * 57.2958).round()}°',
                      value: _radians,
                      min: 0.0,
                      max: math.pi,
                      onChanged: (value) {
                        setState(() {
                          _radians = value;
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
              TrainingStationAppbar(
                pick: '',
                level: '- Rotation.',
                question:
                    'Rotation is simply movement in a circle around a fixed point.',
                answer: '',
                hint: 'Drag the slider below around to rotate the shape.',
                timeLimit: 120,
                onUpdateScore: () {},
                score: 0,
              )
            ],
          ),
          Visibility(visible: isLoading, child: Loading())
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
      ..color = const Color.fromARGB(255, 2, 28, 30)
      ..strokeWidth = 3
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
