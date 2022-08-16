import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/customAppbar.dart';
import 'package:math_geometry/widgets/toolbar.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:math_geometry/canvas/grid.dart';
import 'package:math_geometry/canvas/painter.dart';
import '../menus/intermediate_level.dart';
import 'dart:math' as math;

class Intermediate extends StatefulWidget {
  const Intermediate({Key? key}) : super(key: key);

  @override
  State<Intermediate> createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  late GestureDetector touch;
  late CustomPaint canvas;
  late LinePainter linePainter;
  double _scale = 1.0;
  final double _previousScale = 1.0;

  void onPanStart(DragStartDetails details) {
    linePainter.startStroke(details.localPosition);
  }

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final level = ModalRoute.of(context)!.settings.arguments as IntermediateLs;
    linePainter = LinePainter(int.parse(level.level) - 1);

    return Scaffold(
      floatingActionButton: ToolBar(
          zoomIn: () {
            _scale = _scale * 1.1;
            setState(() {});
          },
          zoomOut: () {
            if (_scale > 1.0) {
              _scale = _scale / 1.1;
            }
            setState(() {});
          },
          onClick: () => setState(() {
                isVisible = !isVisible;
              }),
          delete: () => linePainter.deletePoint()),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          GestureDetector(
            // onScaleStart: (ScaleStartDetails details) {
            //   _previousScale = _scale;
            //   setState(() {});
            // },
            // onScaleUpdate: (ScaleUpdateDetails details) {
            //   _scale = _previousScale * details.scale;
            // },
            // onScaleEnd: (ScaleEndDetails details) {
            //   _previousScale = 1.0;
            //   setState(() {});
            // },
            onPanStart: onPanStart,
            child: RepaintBoundary(
              child: Container(
                  color: Colors.white,
                  height: double.infinity,
                  width: double.infinity,
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform:
                        Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
                    child: CustomPaint(
                      foregroundPainter: linePainter,
                      child: Visibility(
                        visible: isVisible,
                        child: const MyGrid(),
                      ),
                    ),
                  )),
            ),
          ),
          CustomAppBar(level.level, level.question, level.answer.toString(), '',
              level.hint, 0, () {}, level.timeLimit)
        ],
      ),
    );
  }
}

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
  @override
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
    //creating the center variable
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    //a temp list to iterate through the question list and add the center to each pt

    List<Offset> qp = [];

    for (var point in levels.levels[index].qPoints) {
      qp.add(Offset(point.dx + centerX, point.dy + centerY));
    }

    Paint strokePaint = Paint();
    strokePaint.color = Colors.teal;
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 2;

    Paint pointPaint = Paint();
    pointPaint.strokeWidth = 10;
    pointPaint.color = Colors.teal;
    pointPaint.strokeCap = StrokeCap.round;

    //question points
    Path path = Path();
    path.addPolygon(qp, true);
    canvas.drawPath(path, strokePaint);
    canvas.drawPoints(PointMode.points, qp, pointPaint);

    //display question point coordinates
    for (var point in qp) {
      //debug logging the getSides() method
      var rackup = 0;

      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.red[900]),
          text:
              '${alphabet[rackup]}(${point.dx.toInt() + -centerX}, ${point.dy.toInt() - centerY})');
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          textScaleFactor: .8);
      tp.layout();
      tp.paint(canvas, Offset(point.dx, point.dy));

      // debug logs
      // ignore: avoid_print
      print('Distance:  ${distance(qp[rackup], qp[rackup + 1])}');

      // distance will only show if there are more than 1 point(s)
      if (qp.length > 1) {
        TextSpan span = TextSpan(
            style: TextStyle(color: Colors.red[900]),
            text: '${distance(qp[rackup], qp[rackup + 1])}cm');
        TextPainter tp = TextPainter(
            text: span,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            textScaleFactor: 1.0);
        tp.layout();
        tp.paint(canvas, midPoint(qp[rackup], qp[rackup + 1]));

        // ignore: avoid_print
        print(
            'Angle of ${alphabet[rackup]} and ${alphabet[rackup + 1]}: ${calcAngle(qp[rackup], qp[rackup + 1])}');
      }

      // indexer
      ++rackup;
    }

    for (var stroke in strokes) {
      canvas.drawPoints(PointMode.points, stroke, pointPaint);
      Path strokePath = Path();
      strokePath.addPolygon(points, true);
      canvas.drawPath(strokePath, strokePaint);
    }

    for (var point in points) {
      //debug logging the getSides() method
      var counter = 0;

      // display plotted point coordinates
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.red[900]),
          text:
              '${alphabet[counter]}(${point.dx.toInt() - centerX}, ${point.dy.toInt() - centerY})');
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;

  @override
  // TODO: implement semanticsBuilder
  SemanticsBuilderCallback? get semanticsBuilder => null;
}
