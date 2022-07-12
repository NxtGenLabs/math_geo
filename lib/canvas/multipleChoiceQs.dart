import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

class MultipleChoiceQs extends ChangeNotifier implements CustomPainter {
  List<String> alphabet = [
    'a',
    'b',
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
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    late List<Offset> qPoints1 = [
      Offset(500, 100),
      Offset(100, 100),
      Offset(100, 300)
    ];

    late List<Offset> OptionA = [
      Offset(1200, 100),
      Offset(1000, 100),
      Offset(1000, 300)
    ];

    late List<Offset> OptionB = [
      Offset(1200, 400),
      Offset(1000, 400),
      Offset(1000, 600)
    ];

    late List<Offset> OptionC = [
      Offset(500, 400),
      Offset(100, 400),
      Offset(100, 600)
    ];

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

    Path OptionAPath = Path();
    path.addPolygon(OptionA, true);
    canvas.drawPath(path, strokePaint);

    Path OptionBPath = Path();
    path.addPolygon(OptionB, true);
    canvas.drawPath(path, strokePaint);

    Path option3Path = Path();
    path.addPolygon(OptionC, true);
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
    for (var point in OptionA) {
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
    for (var point in OptionB) {
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
    for (var point in OptionC) {
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

    TextSpan span =
        TextSpan(style: TextStyle(color: Colors.red[900]), text: 'A');
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: 2);
    tp.layout();
    tp.paint(canvas, Offset(centerX + 20, centerY - 50));

    TextSpan btext =
        TextSpan(style: TextStyle(color: Colors.red[900]), text: 'B');
    TextPainter tpB = TextPainter(
        text: btext,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: 2);
    tpB.layout();
    tpB.paint(canvas, Offset(centerX + 20, centerY));

    TextSpan ctext =
        TextSpan(style: TextStyle(color: Colors.red[900]), text: 'C');
    TextPainter tpC = TextPainter(
        text: ctext,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: 2);
    tpC.layout();
    tpC.paint(canvas, Offset(centerX - 40, centerY));

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
