import 'package:flutter/material.dart';
import 'package:math_geometry/pages/topics/transformations/level/beginner.dart';
import 'dart:math' as math;

import '../pages/topics/transformations/menus/beginner_level.dart';

class MultipleChoiceQs extends ChangeNotifier implements CustomPainter {
  late int index;

  MultipleChoiceQs(int index) {
    this.index = index;
  }
  List<String> alphabet = [
    'a',
    'b',
    'c',
    'd',
    'e',
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

  BeginnerLevel levels = BeginnerLevel();
  Beginner level = Beginner();

  bool hitTest(Offset position) => true;

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    List<Offset> qp = [];
    List<Offset> oA = [];
    List<Offset> oB = [];
    List<Offset> oC = [];

    for (var point in levels.levels[index].qPoints) {
      qp.add(Offset(point.dx + centerX, point.dy + centerY));
    }
    for (var point in levels.levels[index].optionA) {
      oA.add(Offset(point.dx + centerX, point.dy + centerY));
    }
    for (var point in levels.levels[index].optionB) {
      oB.add(Offset(point.dx + centerX, point.dy + centerY));
    }
    for (var point in levels.levels[index].optionC) {
      oC.add(Offset(point.dx + centerX, point.dy + centerY));
    }

    Paint strokePaint = Paint();
    strokePaint.color = Colors.teal;
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 4;

    Paint pointPaint = Paint();
    pointPaint.strokeWidth = 10;
    pointPaint.color = Colors.teal;
    pointPaint.strokeCap = StrokeCap.round;

    Path path = Path();
    path.addPolygon(qp, true);
    path.addPolygon(oA, true);
    path.addPolygon(oB, true);
    path.addPolygon(oC, true);
    canvas.drawPath(path, strokePaint);

    var counter = 0;
    for (var point in qp) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.orange[800]), text: alphabet[counter]);
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: 2);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));
      ++counter;
    }
    counter = 0;
    for (var point in oA) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.orange[800]), text: alphabet[counter]);
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: 2);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));
      ++counter;
    }

    counter = 0;
    for (var point in oB) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.orange[800]), text: alphabet[counter]);
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: 1);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));
      ++counter;
    }

    counter = 0;
    for (var point in oC) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.orange[800]), text: alphabet[counter]);
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: 1);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));
      ++counter;
    }

    TextSpan span =
        TextSpan(style: TextStyle(color: Colors.orange[800]), text: 'A');
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: 2);
    tp.layout();
    tp.paint(canvas, Offset(centerX + 10, centerY - 40));

    TextSpan btext =
        TextSpan(style: TextStyle(color: Colors.orange[800]), text: 'B');
    TextPainter tpB = TextPainter(
        text: btext,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: 2);
    tpB.layout();
    tpB.paint(canvas, Offset(centerX + 10, centerY));

    TextSpan ctext =
        TextSpan(style: TextStyle(color: Colors.orange[800]), text: 'C');
    TextPainter tpC = TextPainter(
        text: ctext,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: 2);
    tpC.layout();
    tpC.paint(canvas, Offset(centerX - 30, centerY));

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
