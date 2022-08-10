import 'package:flutter/material.dart';
import 'dart:math' as math;
// user defined imports
import 'package:math_geometry/canvas/grid.dart';

class Reflection extends StatefulWidget {
  @override
  _ReflectionState createState() => _ReflectionState();
}

class _ReflectionState extends State<Reflection> {
  // reflection types
  var _reflectionsTypes = [
    'Reflection Across Y-axis',
    'Reflection Across X-axis',
    'Reflection Across Y = X',
    'Reflection Across Y = -X'
  ];

  // positional variables
  double _moveMidline = 0.0;
  double _moveShapeByY = 0.0;
  double _moveShapeByX = 0.0;

  // labels
  late var defaultReflectionType = _reflectionsTypes[0];
  int _reflectionTypeChecker = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reflection'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CustomPaint(
                painter: MyGridPainter(),
                foregroundPainter: reflectionPainter(_moveMidline, _moveShapeByY,
                    _moveShapeByX, _reflectionTypeChecker),
                child: Container(),
              ),
            ),
            // dropdown menu for the selector
            Center(
              child: DropdownButton(
                value: defaultReflectionType,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: _reflectionsTypes.map((String types) {
                  return DropdownMenuItem(value: types, child: Text(types));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    defaultReflectionType = newValue!;
                    switch (newValue) {
                      case 'Reflection Across Y-axis':
                        {
                          _reflectionTypeChecker = 1;
                        }
                        break;
                      case 'Reflection Across X-axis':
                        {
                          _reflectionTypeChecker = 2;
                        }
                        break;
                      case 'Reflection Across Y = X':
                        {
                          _reflectionTypeChecker = 3;
                        }
                        break;
                      case 'Reflection Across Y = -X':
                        {
                          _reflectionTypeChecker = 4;
                        }
                        break;
                      default:
                        {
                          _reflectionTypeChecker = 1;
                        }
                        break;
                    }
                  });
                },
              ),
            ),
            // for the yaxis slider
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('move by y'),
            ),
            Slider(
              value: _moveShapeByY,
              min: -MediaQuery.of(context).size.width / 2.5,
              max: MediaQuery.of(context).size.width / 2.5,
              onChanged: (value) {
                setState(() {
                  _moveShapeByY = value;
                });
              },
            ),
            // for the  xaxis slider
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('move by x'),
            ),
            Slider(
              value: _moveShapeByX,
              min: -MediaQuery.of(context).size.height / 3,
              max: MediaQuery.of(context).size.height / 3,
              onChanged: (value) {
                setState(() {
                  _moveShapeByX = value;
                });
              },
            ),
            // for the  midline slider
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('move by x'),
            ),
            Slider(
              value: _moveMidline,
              min: -MediaQuery.of(context).size.height / 3,
              max: MediaQuery.of(context).size.height / 3,
              onChanged: (value) {
                setState(() {
                  _moveMidline = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class reflectionPainter extends CustomPainter {
  // positional variables
  double moveMidline;
  double moveShapeByY;
  double moveShapeByX;
  int reflectionTypeChecker;

  reflectionPainter(this.moveMidline, this.moveShapeByY, this.moveShapeByX,
      this.reflectionTypeChecker);

  @override
  void paint(Canvas canvas, Size size) {
    // screen's center
    Offset screenCenter = Offset(size.width / 2, size.height / 2);
    // translating entire canvas to ensure it behaves like a classical graph
    canvas.translate(screenCenter.dx, screenCenter.dy);
    canvas.scale(1, -1);

    // object paints and paths
    Paint ogPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path ogPath = Path();

    Paint imgPaint = Paint()
      ..color = Colors.teal
      ..strokeWidth = ogPaint.strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path imgPath = Path();

    Paint midlinePaint = imgPaint;
    Path midlinePath = Path();

    // shape Coordinates
    List<Offset> original = [
      Offset(-100 + moveShapeByY, 200 + moveShapeByX),
      Offset(-100 + moveShapeByY, 100 + moveShapeByX),
      Offset(-50 + moveShapeByY, 50 + moveShapeByX),
    ];
    List<Offset> image = [];

    // painting original shape
    ogPath.addPolygon(original, true);
    canvas.drawPath(ogPath, ogPaint);

    // !reflection functions
    reflectionAcrossY(
        List<Offset> ogShape, List<Offset> imgShape, List<Offset> midline) {
      for (Offset point in ogShape) {
        double distFromPointToMidline =
            distanceBetweenTwoPoints(point, Offset(midline[0].dx, point.dy));
        if (point.dx < midline[0].dx) {
          imgShape
              .add(Offset(midline[0].dx + distFromPointToMidline, point.dy));
        } else if (point.dx > midline[0].dx) {
          imgShape
              .add(Offset(midline[0].dx - distFromPointToMidline, point.dy));
        } else {
          print('on center!');
        }
      }
      return (imgShape);
    }

    reflectionAcrossX(
        List<Offset> ogShape, List<Offset> imgShape, List<Offset> midline) {
      for (Offset point in ogShape) {
        double distFromPointToMidline =
            distanceBetweenTwoPoints(point, Offset(point.dx, midline[0].dy));
        if (point.dy < midline[0].dy) {
          imgShape
              .add(Offset(point.dx, midline[0].dy + distFromPointToMidline));
        } else if (point.dy > midline[0].dy) {
          imgShape
              .add(Offset(point.dx, midline[0].dy - distFromPointToMidline));
        } else {
          print('on center!');
        }
      }
      return (imgShape);
    }

    reflectionAcrossYEqX(List<Offset> ogShape, List<Offset> imgShape) {
      for (Offset point in ogShape) {
        imgShape.add(Offset(point.dy, point.dx));
      }
      return (imgShape);
    }

    reflectionAcrossYEqNegX(List<Offset> ogShape, List<Offset> imgShape) {
      for (Offset point in ogShape) {
        imgShape.add(Offset(-point.dy, -point.dx));
      }
      return (imgShape);
    }

    // painting image shape
    switch (reflectionTypeChecker) {
      case 1:
        {
          // painting line of symmetry
          List<Offset> midline = [
            Offset(0 + moveMidline, size.height),
            Offset(0 + moveMidline, -size.height)
          ];
          canvas.drawLine(midline[0], midline[1], midlinePaint);

          image = reflectionAcrossY(original, image, midline);
          imgPath.addPolygon(image, true);
          canvas.drawPath(imgPath, imgPaint);
        }
        break;
      case 2:
        {
          // painting line of symmetry
          List<Offset> midline = [
            Offset(-size.width, 0 + moveMidline),
            Offset(size.width, 0 + moveMidline)
          ];
          canvas.drawLine(midline[0], midline[1], midlinePaint);

          image = reflectionAcrossX(original, image, midline);
          imgPath.addPolygon(image, true);
          canvas.drawPath(imgPath, imgPaint);
        }
        break;
      case 3:
        {
          // painting line of symmetry
          List<Offset> midline = [
            Offset(size.width, size.height),
            Offset(-size.width, -size.height)
          ];
          canvas.drawLine(midline[0], midline[1], midlinePaint);

          image = reflectionAcrossYEqX(original, image);
          imgPath.addPolygon(image, true);
          canvas.drawPath(imgPath, imgPaint);
        }
        break;
      case 4:
        {
          // painting line of symmetry
          List<Offset> midline = [
            Offset(-size.width, size.height),
            Offset(size.width, -size.height)
          ];
          canvas.drawLine(midline[0], midline[1], midlinePaint);

          image = reflectionAcrossYEqNegX(original, image);
          imgPath.addPolygon(image, true);
          canvas.drawPath(imgPath, imgPaint);
        }
        break;
      default:
        {
          reflectionTypeChecker = 1;
        }
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// Distance function d= sqrt((X2   - X1)² + (y2 - y1)²)
distanceBetweenTwoPoints(Offset point1, Offset point2) {
  var getDistance = math.pow((point2.dx - point1.dx), 2) +
      math.pow((point2.dy - point1.dy), 2);
  return (math.sqrt(getDistance));
}

slopeOfLineOfTwoPoints(Offset point1, Offset point2) {
  var changeInY = (point2.dy - point1.dy);
  var changeInX = (point2.dx - point1.dx);
  var slope = changeInY / changeInX;
  return (slope);
}
