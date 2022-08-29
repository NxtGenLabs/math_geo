import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';

mixin Painterfunction {
  double pi = math.pi;

//? to find the distance between two points
  double distanceBetweenTwoPoints(Offset point1, Offset point2) {
    // delta x
    var changeInX = point2.dx - point1.dx;
    var changeInXSquared = math.pow(changeInX, 2);
    // delta y
    var changeInY = point2.dy - point1.dy;
    var changeInYSquared = math.pow(changeInY, 2);
    // square root of deltas is distance
    var distance = math.sqrt((changeInXSquared + changeInYSquared));
    return (distance);
  }

//? to find the angle between two points
  double angleToFind(List<Offset> initialLine, List<Offset> terminalLine) {
    double ang1 = math.atan2(initialLine.last.dy - initialLine.first.dy,
            initialLine.last.dx - initialLine.first.dx) *
        (180 / pi);
    double ang2 = math.atan2(terminalLine.last.dy - terminalLine.first.dy,
            terminalLine.last.dx - terminalLine.first.dx) *
        (180 / pi);
    double angle = ang2 - ang1;
    return (angle);
  }

//? checks if two lists are equal
  bool checkAnswer(var list1, var list2) {
    // check if both are lists
    if (list1.toString() != list2.toString()) {
      print('Your coordinates are off.');
      return false;
    }
    // check if elements are equal
    if (list2.length != list1.length) {
      print('You drew a different type of polygon');
      return false;
    }
    return true;
  }

//? gets random question in list
  getRandomQuestion(List<List<Offset>> list) {
    final random = math.Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

//? calculating midpoint function
  midPoint(Offset point1, Offset point2) {
    double midP1 = (point1.dx + point2.dx) / 2;
    double midP2 = (point1.dy + point2.dy) / 2;
    return Offset(midP1, midP2);
  }

//? returns shape in units of 1 of divisio by 40
  returnShape(List<Offset> getShape) {
    List<Offset> original = [];
    for (var point in getShape) {
      original.add(Offset(point.dx * 40, point.dy * 40));
    }
    return original;
  }

//! PAINTS
  Paint strokePaint = Paint()
    ..color = const Color.fromARGB(255, 96, 102, 92)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  Paint imagePaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round;

  Paint pointPaint = Paint()
    ..strokeWidth = 5
    ..color = const Color.fromARGB(255, 26, 26, 26)
    ..strokeCap = StrokeCap.round;

  Paint circlePaint = Paint()
    ..strokeWidth = 5
    ..color = const Color.fromARGB(255, 96, 102, 92)
    ..strokeWidth = 5;

  Paint linesPaint = Paint()
    ..color = const Color.fromARGB(255, 96, 56, 19)
    ..style = PaintingStyle.stroke;

//! PAINTER
  var strokes = <List<Offset>>[];
  List<Offset> points = [];

//! ---------------------/////
//! ORIGINAL PAINTER //////
//! ---------------------//////
}

class GesturePainter extends ChangeNotifier
    with Painterfunction
    implements CustomPainter {
  @override
  bool hitTest(Offset position) => true;

  void startStroke(Offset position) {
    // print("start stroke");
    strokes.add([position]);
    points.add(Offset(position.dx, position.dy));
    notifyListeners();
  }

  void appendStroke(Offset position) {
    // print("appending stroke");
    var stroke = strokes.last;
    stroke.add(position);
    notifyListeners();
  }

  void deletePoint() {
    if (strokes.isNotEmpty && points.isNotEmpty) {
      strokes.removeLast();
      points.removeLast();
      notifyListeners();
    }
  }

  void endStroke() {
    notifyListeners();
  }

  getPoints() {
    return points;
  }

  //! ---------------------------------- //

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    //! VARIABLE DEFINITIONS
    var answerCoords = [];
    Path drawAnswerPath = Path();
    List<Offset> drawAnswerCoords = [];
    var pointer = [];

    //!
    for (var point in strokes) {
      answerCoords.add(point.last);
      for (var point in answerCoords) {
        double x = ((center.dx - point.dx) / 40).roundToDouble() /* / 40 */;
        double y = ((center.dy - point.dy) / 40).roundToDouble() /* / 40 */;

        // making sure that the signs are correct
        // according to which quadrant you're in
        if (x > center.dx && y > center.dy) {
          // quadrant I
          x = x * -1; // cause it gives it a wrong sign of negative
        } else if (x < center.dx && y > center.dy) {
          // quadrant II
          x = x * -1; // cause it gives it a wrong sign of positive
        } else if (x < center.dx && y < center.dy) {
          // quadrant III
          x = x * -1; // cause it gives it a wrong sign of positive
        } else if (x > center.dx && y < center.dy) {
          // quadrant IV
          x = x * -1; // cause it gives it a wrong sign of negative
        } else {
          // at center?
          print('At center...');
        }
        pointer.add(Offset(x, y));
      }
    }
    // painging origin
    canvas.drawCircle(center, 5, pointPaint);

    //!---------------------------//
    //!--------------------------//
    //!---- GESTURE PAINTEING ----//
    //!------------------------//
    //!-----------------------//
    for (var stroke in strokes) {
      Path strokePath = Path();

      Offset a = center /*stroke.first*/;
      Offset b = stroke.last;

      drawAnswerCoords.add(b);

      strokePath.moveTo(a.dx, a.dy);
      strokePath.lineTo(b.dx, b.dy);
      canvas.drawPoints(PointMode.points, [a, b], pointPaint);
      canvas.drawPath(strokePath, linesPaint);
      canvas.drawCircle(b, 8, circlePaint);

      //!
      List<Offset> initialLine = [
        a,
        Offset(size.width, center.dy),
      ];
      List<Offset> terminalLine = [
        initialLine.first,
        b,
      ];

      //? displaying angle, line length(distance) and coordinates
      double theta = angleToFind(initialLine, terminalLine);
      double dist = distanceBetweenTwoPoints(a, b);
    }
    drawAnswerPath.addPolygon(drawAnswerCoords, true);
    canvas.drawPath(drawAnswerPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;

  @override
  // TODO: implement semanticsBuilder
  SemanticsBuilderCallback? get semanticsBuilder => null;
}

//! ---------------------/////
//! ORIGINAL PAINTER //////
//! ---------------------//////
class OriginalShapePainter extends CustomPainter with Painterfunction {
  late double degrees;
  late List<Offset> original;
  OriginalShapePainter(double value, List<Offset> getShape) {
    degrees = value;
    original = returnShape(getShape);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset screenCenter = Offset(size.width / 2, size.height / 2);
    canvas.translate(screenCenter.dx, screenCenter.dy);
    canvas.scale(1, -1);

    //! origin coordinates
    Offset center = const Offset(0, 0);
    //? displaying image
    List<Offset> image = [];
    Path imagePath = Path();

    for (var point in original) {
      //!
      List<Offset> initialLine = [
        center,
        Offset(size.width, center.dy),
      ];
      List<Offset> terminalLine = [
        initialLine.first,
        point,
      ];

      //?
      // canvas.drawCircle(point, 5, pointPaint);

      //?
      double theta = angleToFind(initialLine, terminalLine);
      double angle = theta * (pi / 180);
      double dist =
          distanceBetweenTwoPoints(terminalLine.first, terminalLine.last);

      double x = dist * math.cos(angle + degrees);
      double y = dist * math.sin(angle + degrees);
      image.add(Offset(x, y));

      //? angle lines
      // Path linePath = Path()
      //   ..moveTo(point.dx, point.dy)
      //   ..lineTo(center.dx, center.dy);
      // canvas.drawPath(linePath, imagePaint);

      //! og shape painter ends here
    }

    imagePath.addPolygon(image, true);
    canvas.drawPath(imagePath, strokePaint);
    // ends here
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
