import 'package:flutter/material.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/menus/beginner_level.dart';

import '../pages/classes/Form 3/subjects/Mathematics/topics/transformations/level/beginner.dart';

class MultipleChoiceQs extends ChangeNotifier implements CustomPainter {
  late int index;

  MultipleChoiceQs(this.index);
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

  @override
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
      qp.add(Offset((point.dx * 40) + centerX, (point.dy * -40) + centerY));
    }
    for (var point in levels.levels[index].optionA) {
      oA.add(Offset((point.dx * 40) + centerX, (point.dy * -40) + centerY));
    }
    for (var point in levels.levels[index].optionB) {
      oB.add(Offset((point.dx * 40) + centerX, (point.dy * -40) + centerY));
    }
    for (var point in levels.levels[index].optionC) {
      oC.add(Offset((point.dx * 40) + centerX, (point.dy * -40) + centerY));
    }

    Paint strokePaint = Paint();
    strokePaint.color = const Color.fromARGB(255, 44, 95, 45);
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 3;

    Paint pointPaint = Paint();
    pointPaint.strokeWidth = 5;
    pointPaint.color = Colors.white;
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
          style: const TextStyle(color: Colors.black), text: alphabet[counter]);
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
    for (var point in oA) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.orange[800]), text: alphabet[counter]);
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
    for (var point in oB) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.orange[800]), text: alphabet[counter]);
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
