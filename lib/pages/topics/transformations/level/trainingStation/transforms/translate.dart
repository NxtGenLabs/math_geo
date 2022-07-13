// ignore_for_file: prefer_final_fields, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../../../canvas/grid.dart';

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  var _sides = 3.0;
  var _radius = 100.0;
  var _radians = 0.0;
  var _HPosition = 0.0;
  var _VPosition = 0.0;
  var _DPosition = 0.0;
  var _max = 100.0;
  late CustomPainter painterChoice =
      HTranslatePainter(_sides, _radius, _radians, _HPosition);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Transformations Visualizer'),
      ),
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: Colors.grey[400],
            child: CustomPaint(
              foregroundPainter: painterChoice,
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
                      height: 250,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 10.0),
                          child: Text('Horizontal Translation'),
                        ),
                        Slider(
                          value: _HPosition,
                          min: 0.0,
                          max: _max,
                          onChanged: (value) {
                            painterChoice = HTranslatePainter(
                                _sides, _radius, _radians, _HPosition);
                            setState(() {
                              _HPosition = value;
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 10.0),
                          child: Text('Vertical Translation'),
                        ),
                        Slider(
                          value: _VPosition,
                          min: 0.0,
                          max: _max,
                          onChanged: (value) {
                            painterChoice = VTranslatePainter(
                                _sides, _radius, _radians, _VPosition);
                            setState(() {
                              _VPosition = value;
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 10.0),
                          child: Text('Diagonal Translation'),
                        ),
                        Slider(
                          value: _DPosition,
                          min: 0.0,
                          max: _max,
                          onChanged: (value) {
                            painterChoice = DTranslatePainter(
                                _sides, _radius, _radians, _DPosition);
                            setState(() {
                              _DPosition = value;
                            });
                          },
                        ),
                      ]))
                ]),
          ),
        ]),
      ),
    );
  }
}

// paints shapes horizontal translation
class HTranslatePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;
  final double position;
  HTranslatePainter(this.sides, this.radius, this.radians, this.position);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint = Offset(
        (radius * math.cos(radians)) + position, radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx + position;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// paints shapes vertical translation
class VTranslatePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;
  final double position;
  VTranslatePainter(this.sides, this.radius, this.radians, this.position);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint = Offset(
        radius * math.cos(radians), radius * math.sin(radians) + position);

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy + position;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// paints shapes diagonal translation
class DTranslatePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;
  final double position;
  DTranslatePainter(this.sides, this.radius, this.radians, this.position);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint = Offset(radius * math.cos(radians) + position,
        radius * math.sin(radians) + position);

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx + position;
      double y = radius * math.sin(radians + angle * i) + center.dy + position;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}