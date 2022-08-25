import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

import '../pages/classes/Form 3/subjects/Mathematics/topics/transformations/menus/intermediate_level.dart';

class LinePainter extends ChangeNotifier implements CustomPainter {
  late int index;

  LinePainter(int index) {
    this.index = index;
  }
  TransFormationsLevels levels = TransFormationsLevels();

  var strokes = <List<Offset>>[];
  var points = <Offset>[];
  List<String> alphabet = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
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
  @override
  bool hitTest(Offset position) => true;

  void startStroke(Offset position) async {
    final player = AudioPlayer();
    await player.play(AssetSource('draw.wav'));
    double snapX = position.dx.roundToDouble();
    double snapY = position.dy.roundToDouble();
    Offset snapPos = Offset(snapX, snapY);
    strokes.add([snapPos]);
    points.add(snapPos);
    notifyListeners();
  }

  void deletePoint() {
    if (strokes.isNotEmpty && points.isNotEmpty) {
      strokes.removeLast();
      points.removeLast();
      notifyListeners();
    }
  }

  // Distance function::
  distance(Offset point1, Offset point2) {
    var getDistance = math.pow((point2.dx - point1.dx), 2) +
        math.pow((point2.dy - point1.dy), 2);
    return math.sqrt(getDistance).toInt();
  }

  // angle calculator method
  calcAngle(Offset v1, Offset v2) {
    var vecDotProduct =
        (v1.dx * v2.dx) + (v1.dy * v2.dy); // the dotproduct of 2d vectors
    var magVec1 = math
        .sqrt(math.pow(v1.dx, 2) + math.pow(v1.dy, 2)); // magnitude of vector 1
    var magVec2 = math
        .sqrt(math.pow(v2.dx, 2) + math.pow(v2.dy, 2)); // magnitude of vector 2
    var magProduct = magVec1 * magVec2;

    var angle = math.acos(vecDotProduct / magProduct);
    return angle;
  }

  // calculating midpoint function
  midPoint(Offset point1, Offset point2) {
    double midP1 = (point1.dx + point2.dx) / 2;
    double midP2 = (point1.dy + point2.dy) / 2;
    return Offset(midP1, midP2);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var qcount = 0;
    //creating the center variable
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    //a temp list to iterate through the question list and add the center to each pt

    List<Offset> qp = [];

    for (var point in levels.levels[index].qPoints) {
      qp.add(Offset((point.dx * 40) + centerX, (point.dy * -40) + centerY));
    }

    Paint strokePaint = Paint();
    strokePaint.color = const Color.fromARGB(255, 188, 141, 47);
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 3;

    Paint pointPaint = Paint();
    pointPaint.strokeWidth = 15;
    pointPaint.color = const Color.fromARGB(255, 188, 141, 47);
    pointPaint.strokeCap = StrokeCap.round;

    //question points
    Path path = Path();
    path.addPolygon(qp, true);
    canvas.drawPath(path, strokePaint);
    canvas.drawPoints(PointMode.points, qp, pointPaint);

    //display question point coordinates

    for (var stroke in strokes) {
      canvas.drawPoints(PointMode.points, stroke, pointPaint);
      Path strokePath = Path();
      strokePath.addPolygon(points, true);
      canvas.drawPath(strokePath, strokePaint);
    }

//question data
    // for (var point in qp) {
    //   //debug logging the getSides() method

    //   TextSpan span = TextSpan(
    //       style: TextStyle(color: Colors.red[900]),
    //       text:
    //           '${alphabet[count]}(${point.dx.toInt() + -centerX}, ${point.dy.toInt() - centerY})');
    //   TextPainter qtp = TextPainter(
    //       text: span,
    //       textAlign: TextAlign.left,
    //       textDirection: TextDirection.ltr,
    //       textScaleFactor: .8);
    //   qtp.layout();
    //   qtp.paint(canvas, Offset(point.dx, point.dy));

    //   // debug logs
    //   // ignore: avoid_print
    //   print('Distance:  ${distance(qp[count], qp[count + 1])}');

    //   // distance will only show if there are more than 1 point(s)
    //   if (qp.length > 1) {
    //     TextSpan span = TextSpan(
    //         style: TextStyle(color: Colors.red[900]),
    //         text: '${distance(qp[count], qp[count + 1])}cm');
    //     TextPainter qtp = TextPainter(
    //         text: span,
    //         textAlign: TextAlign.left,
    //         textDirection: TextDirection.ltr,
    //         textScaleFactor: 1.0);
    //     qtp.layout();
    //     qtp.paint(canvas, midPoint(qp[count], qp[count + 1]));
    //   }
    //   // indexer
    //   ++count;
    // }

    for (var point in points) {
      //debug logging the getSides() method

      // display plotted point coordinates
      TextSpan plotText = TextSpan(
          style: const TextStyle(color: Colors.black),
          text:
              '${alphabet[qcount]}(${(((point.dx - centerX) * 0.1) / 4).round()}, ${(((point.dy - centerY) * -0.1) / 4).round()})');
      TextPainter pt = TextPainter(
          text: plotText,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: .8);
      pt.layout();
      pt.paint(canvas, Offset(point.dx, point.dy));

      // distance will only show if there are more than 1 point(s)
      if (points.length > 1) {
        TextSpan plotText = TextSpan(
            style: const TextStyle(color: Colors.black),
            text:
                '${distance((points[qcount]) * 0.1, (points[qcount + 1] * 0.1))}cm');
        TextPainter pt = TextPainter(
            text: plotText,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            textScaleFactor: .8);
        pt.layout();
        pt.paint(canvas, midPoint(points[qcount], points[qcount + 1]));
      }
      // indexer
      ++qcount;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;

  @override
  // TODO: implement semanticsBuilder
  SemanticsBuilderCallback? get semanticsBuilder => null;
}
