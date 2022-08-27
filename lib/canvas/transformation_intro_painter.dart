import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// FOR PAINTING POLYGONS
class ShapePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;
  final double position;

  ShapePainter(this.sides, this.radius, this.radians, this.position);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    var path = Path();

    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x + position, y + position);
    }
    path.close();
    canvas.drawPath(path, paint);

    // displaying angle
    TextSpan span = TextSpan(
        style: TextStyle(color: Colors.red[900]),
        text: '${const Offset(0, 0)}');
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: .8);
    tp.layout();
    tp.paint(canvas, Offset(size.width / 2, size.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
