import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

// FOR PAINTING POLYGONS
class ShapePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;
  ShapePainter(this.sides, this.radius, this.radians);

  // angle calculator method
  calcAngle(Offset v1, Offset v2) {
    var vecDotProduct = (v1.dx * v2.dx) + (v1.dy * v2.dy); // the dotproduct of 2d vectors
    var magVec1 = math.sqrt(math.pow(v1.dx, 2) + math.pow(v1.dy, 2)); // magnitude of vector 1
    var magVec2 = math.sqrt(math.pow(v2.dx, 2) + math.pow(v2.dy, 2)); // magnitude of vector 2
    var magProduct = magVec1 * magVec2;

    var angle = math.acos(vecDotProduct / magProduct);
    return angle;
  }

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
    Offset startPoint = Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);

    // displaying angle
    TextSpan span = TextSpan(style: TextStyle(color: Colors.red[900]), text: '${Offset(0, 0)}');
    TextPainter tp = TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr, textScaleFactor: .8);
    tp.layout();
    tp.paint(canvas, Offset(size.width / 2, size.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
