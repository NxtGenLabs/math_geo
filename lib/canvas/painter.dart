import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

class LinePainter extends ChangeNotifier implements CustomPainter {
  late List<Offset> qPoints = [
    Offset(200, 100),
    Offset(100, 0),
    Offset(50, 60)
  ];
  var strokes = <List<Offset>>[];
  var points = <Offset>[];
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

  void startStroke(Offset position) {
    strokes.add([position]);
    points.add(position);
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
    Paint strokePaint = Paint();
    strokePaint.color = Colors.teal;
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 2;

    Paint pointPaint = Paint();
    pointPaint.strokeWidth = 10;
    pointPaint.color = Colors.teal;
    pointPaint.strokeCap = StrokeCap.round;

    for (var stroke in strokes) {
      canvas.drawPoints(PointMode.points, stroke, pointPaint);
      Path strokePath = Path();
      strokePath.addPolygon(points, true);
      canvas.drawPath(strokePath, strokePaint);
    }

    var counter = 0;

    for (var point in points) {
      //debug logging the getSides() method

      // displaying point value
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.red[900]),
          text:
              '${alphabet[counter]}(${point.dx.toInt()}, ${point.dy.toInt()})');
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: .8);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));

      // debug logs
      // ignore: avoid_print
      print('Distance:  ${distance(points[counter], points[counter + 1])}');

      // distance will only show if there are more than 1 point(s)
      if (points.length > 1) {
        TextSpan span = TextSpan(
            style: TextStyle(color: Colors.red[900]),
            text: '${distance(points[counter], points[counter + 1])}cm');
        TextPainter tp = TextPainter(
            text: span,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            textScaleFactor: 1.0);
        tp.layout();
        tp.paint(canvas, midPoint(points[counter], points[counter + 1]));

        // ignore: avoid_print
        print(
            'Angle of ${alphabet[counter]} and ${alphabet[counter + 1]}: ${calcAngle(points[counter], points[counter + 1])}');
      }

      // indexer
      ++counter;
    }

    //////////paint question points
    Path path = Path();
    path.addPolygon(qPoints, true);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;

  @override
  // TODO: implement semanticsBuilder
  SemanticsBuilderCallback? get semanticsBuilder => null;
}
