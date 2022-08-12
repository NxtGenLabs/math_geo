import 'package:flutter/material.dart';
import 'dart:math' as math;
// user defiend imports
import 'package:math_geometry/canvas/grid.dart';
import 'package:math_geometry/canvas/transformation_intro_painter.dart';

import '../../../../../../../../../widgets/customAppbar.dart';

class TrainingStation extends StatefulWidget {
  const TrainingStation({Key? key}) : super(key: key);

  @override
  _TrainingStationState createState() => _TrainingStationState();
}

class _TrainingStationState extends State<TrainingStation> {
  var _sides = 3.0;
  var _radius = 100.0;
  var _radians = 0.0;
  var _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: Colors.grey[400],
            child: CustomPaint(
              foregroundPainter:
                  ShapePainter(_sides, _radius, _radians, _position),
              painter: MyGridPainter(),
              child: Container(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey,
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 10.0),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text('Translate'),
                    ),
                    Slider(
                      value: _position,
                      min: 0.0,
                      divisions: 10,
                      max: 100,
                      onChanged: (value) {
                        setState(() {
                          _position = value;
                        });
                      },
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CustomAppBar('', '', '', '', '', 0, () {}, 0)],
          )
        ]),
      ),
    );
  }
}
