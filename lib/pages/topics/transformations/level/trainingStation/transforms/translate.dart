import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../../../canvas/grid.dart';
import '../../../../../../canvas/transformation_intro_painter.dart';

class Translate extends StatefulWidget {
  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  var _sides = 3.0;
  var _radius = 100.0;
  var _radians = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Transformations Visualizer'),
      ),
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: Colors.grey[400],
            child: CustomPaint(
              foregroundPainter: ShapePainter(_sides, _radius, _radians),
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
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(children: [
  
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 10.0),
                      child: Text('Translate'),
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
                  ]),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
