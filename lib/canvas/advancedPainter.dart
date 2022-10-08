import 'dart:typed_data';

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
      return false;
    }
    // check if elements are equal
    if (list2.length != list1.length) {
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
  Offset midPoint(Offset point1, Offset point2) {
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

//? return flutter's coordinate system
  List<Offset> returnFlutterAppropritateShape(
      List<Offset> original, Offset center) {
    List<Offset> originalFlutterCoords = [];
    //! coordinate conversions
    for (var point in original) {
      double x = point.dx;
      double y = point.dy;

      //! multiplying coordinates by -1 because they are negative
      //! to achieve flutter's coordinate system we minus
      //! there a minus by center on given question coordiante
      //! result in a conversion back to positive
      //! i.e center.dx - -40 = center.dx + 40;
      //! this wont work when coordinate is less than 0

      // conversions when greater than center on both
      if (x > 0 && y > 0) {
        // quadrant I
        x = center.dx + x;
        y = center.dy - y;
      } else if (x < 0 && y > 0) {
        // quadrant II
        x = x * -1;
        x = center.dx - x;
        y = center.dy - y;
      } else if (x < 0 && y < 0) {
        // quadrant III
        x = x * -1;
        y = y * -1;
        x = center.dx - x;
        y = center.dy + y;
      } else if (x > 0 && y < 0) {
        // quadrant IV
        y = y * -1;
        x = center.dx + x;
        y = center.dy + y;
      }
      /* conversions when one's at center*/
      else if (x == 0 && y > 0) {
        // quadrant I
        x = center.dx;
        y = center.dy - y;
      } else if (x > 0 && y == 0) {
        // quadrant IV
        x = center.dx + x;
        y = center.dy;
      } else if (x < 0 && y == 0) {
        // quadrant II
        x = x * -1;
        x = center.dx - x;
        y = center.dy;
      } else if (x == 0 && y < 0) {
        // quadrant III
        y = y * -1;
        x = center.dx;
        y = center.dy + y;
      } else {
        // completely at center
        x = center.dx;
        y = center.dy;
      }
      originalFlutterCoords.add(Offset(x.roundToDouble(), y.roundToDouble()));
    }
    return originalFlutterCoords;
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

  List<String> coordinateMarkers = [
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
    'Z',
  ];

//! PAINTER
  var strokes = <List<Offset>>[];
  List<Offset> points = [];
}

//! ---------------------/////
//! Gesture PAINTER //////
//! ---------------------//////
class GesturePainter extends ChangeNotifier
    with Painterfunction
    implements CustomPainter {
  @override
  bool hitTest(Offset position) => true;

  void startStroke(Offset position) {
    strokes.add([position]);
    points.add(Offset(position.dx, position.dy));
    notifyListeners();
  }

  void appendStroke(Offset position) {
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
    int indicator = 0;

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

      Offset anchor = center /*stroke.first*/;
      Offset plotPoint = stroke.last;

      drawAnswerCoords.add(plotPoint);

      strokePath.moveTo(anchor.dx, anchor.dy);
      strokePath.lineTo(plotPoint.dx, plotPoint.dy);
      canvas.drawPoints(PointMode.points, [anchor, plotPoint], pointPaint);
      canvas.drawPath(strokePath, linesPaint);
      canvas.drawCircle(plotPoint, 8, circlePaint);

      //!
      List<Offset> initialLine = [
        anchor,
        Offset(size.width, center.dy),
      ];
      List<Offset> terminalLine = [
        initialLine.first,
        plotPoint,
      ];

      //? displaying angle, line length(distance) and coordinates
      double theta = angleToFind(initialLine, terminalLine);
      double dist = distanceBetweenTwoPoints(anchor, plotPoint);
      dist = dist / 40; // to 1:1 ratio
      if (plotPoint.dy < center.dy) {
        theta = theta * -1;
      }
      if (plotPoint.dx < center.dx && plotPoint.dy > center.dy) {
        double diff = (180 - theta);
        theta = 180 + diff;
      } else if (plotPoint.dx > center.dx && plotPoint.dy > center.dy) {
        double diff = (180 - theta);
        theta = 180 + diff;
      }

      // displaying angle
      TextSpan angleText = TextSpan(
        style: const TextStyle(color: Colors.teal),
        text: '${coordinateMarkers[indicator]} ${theta.toInt()}°',
      );
      TextPainter angleTextPainter = TextPainter(
        text: angleText,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: 1,
      );
      angleTextPainter.layout();
      angleTextPainter.paint(
          canvas, Offset(plotPoint.dx - 20, plotPoint.dy - 30));

      // displaying distance + coordinate marker
      Offset midLinePoint =
          midPoint(Offset(anchor.dx - 20, anchor.dy - 20), plotPoint);
      TextSpan distText = TextSpan(
        style: const TextStyle(color: Colors.teal),
        text: '${dist.toInt()}cm',
      );
      TextPainter distTextPainter = TextPainter(
        text: distText,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: 1,
      );
      distTextPainter.layout();
      distTextPainter.paint(canvas, midLinePoint);
      indicator++;
      //! end
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

    //! image
    List<Offset> image = [];
    Path imagePath = Path();
    //!
    canvas.translate(screenCenter.dx, screenCenter.dy);
    // canvas.scale(1, -1);

    //! origin coordinates
    Offset center = const Offset(0, 0);

    //? displaying image
    int indicator = 0;
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
      double theta = angleToFind(initialLine, terminalLine);
      double angle = theta * (pi / 180);
      double dist =
          distanceBetweenTwoPoints(terminalLine.first, terminalLine.last);

      double x = dist * math.cos(angle + degrees);
      double y = -dist * math.sin(angle + degrees);
      image.add(Offset(x, y));
      //! og shape painter ends here
    }
    imagePath.addPolygon(image, true);
    canvas.drawPath(imagePath, strokePaint);

    //! displaying point markers and angle
    for (var point in image) {
      canvas.drawCircle(
          point, 5, circlePaint..color = Color.fromARGB(255, 1, 35, 63));

      List<Offset> initialLine = [
        center,
        Offset(size.width, center.dy),
      ];
      List<Offset> terminalLine = [
        initialLine.first,
        point,
      ];
      //? setting proper values for angle
      double theta = angleToFind(initialLine, terminalLine).roundToDouble();
      if (point.dx < center.dx && point.dy > center.dy) {
        double diff = (180 - theta);
        theta = 180 + diff;
        theta *= -1;
      } else if (point.dx > center.dx && point.dy > center.dy) {
        double diff = (180 - theta);
        theta = 180 + diff;
        theta *= -1;
      }
      //? displying angle
      String pointer = '${coordinateMarkers[indicator]}, ${(theta * -1)}°';
      TextSpan plotText = TextSpan(
        style: const TextStyle(color: Colors.black87),
        text: pointer,
      );
      TextPainter pt = TextPainter(
        text: plotText,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        textScaleFactor: 1,
      );
      pt.layout();
      pt.paint(canvas, Offset(point.dx, point.dy));

      //!
      indicator++;
    }
    // ends here
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
