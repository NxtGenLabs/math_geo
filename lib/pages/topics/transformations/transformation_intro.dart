import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../canvas/grid.dart';
import '../../../canvas/transformation_intro_painter.dart';


class TransformIntro extends StatefulWidget {
  @override
  _TransformIntroState createState() => _TransformIntroState();
}

class _TransformIntroState extends State<TransformIntro> {
  var _sides = 3.0;
  var _radius = 100.0;
  var _radians = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polygons'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CustomPaint(
                painter: ShapePainter(_sides, _radius, _radians),
                foregroundPainter: MyGridPainter(),
                child: Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Sides'),
            ),
            Slider(
              value: _sides,
              min: 3.0,
              max: 10.0,
              label: _sides.toInt().toString(),
              divisions: 7,
              onChanged: (value) {
                setState(() {
                  _sides = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Size'),
            ),
            Slider(
              value: _radius,
              min: 10.0,
              max: MediaQuery.of(context).size.width / 2,
              onChanged: (value) {
                setState(() {
                  _radius = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Rotation'),
            ),
            Slider(
              value: _radians,
              min: 0.0, 
              max: math.pi,
              onChanged: (value) {
                setState(() {
                  _radians = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
