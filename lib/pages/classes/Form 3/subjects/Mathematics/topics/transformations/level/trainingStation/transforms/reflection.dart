import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../../../../../../../canvas/grid.dart';

class Reflection extends StatefulWidget {
  @override
  _ReflectionState createState() => _ReflectionState();
}

class _ReflectionState extends State<Reflection> {
  // positional variables
  var _moveMidline = 0.0;
  var _moveShapeX = 0.0;
  var _moveShapeY = 0.0;
  var _moveShapeXY = 0.0;
  // reflection variables
  String defaultReflection = 'Reflection Across X-axis';
  var _reflections = [
    'Reflection Across X-axis',
    'Reflection Across Y-axis',
    // 'Reflection Across Y = X',
    // 'Reflection Across Y = -X',
  ];
  var _reflectionType = 1;
  var _moveAxis = 'Move the X-axis';

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
                foregroundPainter: ShapePainter(_moveShapeX, _moveShapeY,
                    _moveShapeXY, _moveMidline, _reflectionType),
                child: Container(),
              ),
            ),
            // for the selector
            Center(
              child: DropdownButton(
                value: defaultReflection,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: _reflections.map((String types) {
                  return DropdownMenuItem(value: types, child: Text(types));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    defaultReflection = newValue!;
                    switch (newValue) {
                      case 'Reflection Across X-axis':
                        {
                          _reflectionType = 1;
                          _moveAxis = 'Move the X-axis';
                        }
                        break;
                      case 'Reflection Across Y-axis':
                        {
                          _reflectionType = 2;
                          _moveAxis = 'Move the Y-axis';
                        }
                        break;
                      default:
                        {
                          _reflectionType = 1;
                          _moveAxis = 'Move the X-axis';
                        }
                        break;
                    }
                  });
                },
              ),
            ),
            // for the slider
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Move Shape by X'),
            ),
            Slider(
              value: _moveShapeX,
              min: 0.0,
              max: 600,
              onChanged: (value) {
                setState(() {
                  _moveShapeX = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Move Shape by Y'),
            ),
            Slider(
              value: _moveShapeY,
              min: 0.0,
              max: 600,
              onChanged: (value) {
                setState(() {
                  _moveShapeY = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Move Shape by XY'),
            ),
            Slider(
              value: _moveShapeXY,
              min: 0.0,
              max: 600,
              onChanged: (value) {
                setState(() {
                  _moveShapeXY = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(_moveAxis),
            ),
            Slider(
              value: _moveMidline,
              min: 0.0,
              max: 600,
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

// FOR PAINTING POLYGONS
class ShapePainter extends CustomPainter {
  // externally changing vars
  final double moveShapeX;
  final double moveShapeY;
  final double moveShapeXY;
  final double moveMidline;
  final int reflectionType;

  // constructor
  ShapePainter(this.moveShapeX, this.moveShapeY, this.moveShapeXY,
      this.moveMidline, this.reflectionType);

  @override
  void paint(Canvas canvas, Size size) {
    // painting style of shapes
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // cartesian center coordinate
    final Offset center = Offset(size.width / 2, size.height / 2);

    // original shape coordinates
    var distFromMid = 400;
    List<Offset> original = [
      Offset(400 + moveShapeX + moveShapeXY, 100 + moveShapeY + moveShapeXY),
      Offset(400 + moveShapeX + moveShapeXY, 200 + moveShapeY + moveShapeXY),
      Offset(600 + moveShapeX + moveShapeXY, 200 + moveShapeY + moveShapeXY)
    ];
    Path originalPath = Path();
    originalPath.addPolygon(original, true);
    canvas.drawPath(originalPath, paint);

    // image shape coordinates
    List<Offset> image = [];
    Path imagePath = Path();
    // midline coordinates
    List<Offset> midlineX = [
      Offset(0, (size.height / 2) + moveMidline),
      Offset(size.width, (size.height / 2) + moveMidline)
    ];
    List<Offset> midlineY = [
      Offset(center.dx + moveMidline, 0),
      Offset(center.dx + moveMidline, size.height)
    ];
    List<Offset> midlineYEqX = [Offset(size.width, 0), Offset(0, size.height)];

    // reflection across the y-axis = (-x, y)

    // reflection across the y-axis = (-x, y)
    reflectionAcrossY(List<Offset> original, List<Offset> image) {
      // !image plot
      for (Offset point in original) {
        var tempDist = distance(point, Offset(midlineY[0].dx, point.dy));
        if (point.dx < midlineY[0].dx) {
          image.add(Offset((midlineY[0].dx + tempDist), point.dy));
        } else if (point.dx > midlineY[0].dx) {
          image.add(Offset((midlineY[0].dx - tempDist), point.dy));
        } else {
          print('im at not lesser nor greater than the midline');
        }
      }
      return (image);
    }

    // reflection across the X-axis = (x, -y)
    reflectionAcrossX(List<Offset> original, List<Offset> image) {
      // !image plot
      for (Offset point in original) {
        var tempDist = distance(point, Offset(point.dx, midlineX[0].dy));
        if (point.dy < midlineX[0].dy) {
          image.add(Offset(point.dx, midlineX[0].dy + tempDist));
        } else if (point.dy > midlineX[0].dy) {
          image.add(Offset(point.dx, midlineX[0].dy - tempDist));
        } else {
          print('im at not lesser nor greater than the midline');
        }
      }
      return (image);
    }

    // reflection when y = x => (y, x)
    reflectionAcrossYEqualsX(List<Offset> original, List<Offset> image) {
      // !image plot
      for (Offset point in original) {
        image.add(Offset(point.dy, point.dx));
      }
      return (image);
    }

    // reflection when y = -x => (-y, -x)
    reflectionAcrossYEqualsNegX(List<Offset> original, List<Offset> image) {
      // !image plot
      for (Offset point in original) {
        image.add(Offset((-point.dy), (-point.dy)));
      }
      return (image);
    }

    // switch case for selecting reflectionType
    switch (reflectionType) {
      case 1:
        {
          // across x-axis
          image = reflectionAcrossX(original, image);
          imagePath.addPolygon(image, true);
          canvas.drawPath(imagePath, paint);
          print(reflectionType);
          // midline
          Path midlinePath = Path();
          midlinePath.addPolygon(midlineX, true);
          canvas.drawPath(midlinePath, paint);
        }
        break;
      case 2:
        {
          // across y-axis
          image = reflectionAcrossY(original, image);
          imagePath.addPolygon(image, true);
          canvas.drawPath(imagePath, paint);
          // midline
          Path midlinePath = Path();
          midlinePath.addPolygon(midlineY, true);
          canvas.drawPath(midlinePath, paint);
        }
        break;
      default:
        {
          // defaults to across x-axis
          image = reflectionAcrossY(original, image);
          imagePath.addPolygon(image, true);
          canvas.drawPath(imagePath, paint);
          // midline
          Path midlinePath = Path();
          midlinePath.addPolygon(midlineY, true);
          canvas.drawPath(midlinePath, paint);
        }
        break;

      //TODO: implement two remaining reflection types
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// Distance function d= sqrt((X2   - X1)² + (y2 - y1)²)
distance(Offset point1, Offset point2) {
  var getDistance = math.pow((point2.dx - point1.dx), 2) +
      math.pow((point2.dy - point1.dy), 2);
  return (math.sqrt(getDistance));
}

slopeOfLine(Offset point1, Offset point2) {
  var changeInY = (point2.dy - point1.dy);
  var changeInX = (point2.dx - point1.dx);
  var slope = changeInY / changeInX;
  return (slope);
}
