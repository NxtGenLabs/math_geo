import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

class MultipleChoiceQs extends ChangeNotifier implements CustomPainter {
  late List<Offset> qPoints1 = [
    Offset(500, 100),
    Offset(100, 100),
    Offset(100, 300)
  ];

  late List<Offset> Option1 = [
    Offset(1200, 100),
    Offset(1000, 100),
    Offset(1000, 300)
  ];

  late List<Offset> Option2 = [
    Offset(1200, 400),
    Offset(1000, 400),
    Offset(1000, 600)
  ];

  late List<Offset> Option3 = [
    Offset(500, 400),
    Offset(100, 400),
    Offset(100, 600)
  ];

  List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  bool hitTest(Offset position) => true;

  @override
  void paint(Canvas canvas, Size size) {
    Paint strokePaint = Paint();
    strokePaint.color = Colors.teal;
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 2;

    Paint pointPaint = Paint();
    pointPaint.strokeWidth = 10;
    pointPaint.color = Colors.teal;
    pointPaint.strokeCap = StrokeCap.round;

    Path path = Path();
    path.addPolygon(qPoints1, true);
    canvas.drawPath(path, strokePaint);

    Path option1Path = Path();
    path.addPolygon(Option1, true);
    canvas.drawPath(path, strokePaint);

    Path option2Path = Path();
    path.addPolygon(Option2, true);
    canvas.drawPath(path, strokePaint);

    Path option3Path = Path();
    path.addPolygon(Option3, true);
    canvas.drawPath(path, strokePaint);

    var counter = 0;
    for (var point in qPoints1) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.red[900]),
          text: '${alphabet[counter]}');
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: .8);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));
      ++counter;
    }
    counter = 0;
    for (var point in Option1) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.red[900]),
          text: '${alphabet[counter]}');
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: .8);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));
      ++counter;
    }

    counter = 0;
    for (var point in Option2) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.red[900]),
          text: '${alphabet[counter]}');
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: .8);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));
      ++counter;
    }

    counter = 0;
    for (var point in Option3) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.red[900]),
          text: '${alphabet[counter]}');
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: .8);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));
      ++counter;
    }

    // indexer
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;

  @override
  // TODO: implement semanticsBuilder
  SemanticsBuilderCallback? get semanticsBuilder => null;
}
