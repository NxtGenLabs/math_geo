import 'package:flutter/material.dart';
import 'package:math_geometry/canvas/grid.dart';
import 'package:math_geometry/canvas/multipleChoiceQs.dart';

class Beginner extends StatelessWidget {
  const Beginner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: const Color.fromARGB(224, 224, 224, 255),
        title: const Text('NxtGen Labs Geometry'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.question_mark))
        ],
      ),
      body: GestureDetector(
        child: RepaintBoundary(
          child: Container(
              color: Colors.grey[400],
              height: double.infinity,
              width: double.infinity,
              child: CustomPaint(
                foregroundPainter: MultipleChoiceQs(),
                child: Visibility(
                  child: const MyGrid(),
                ),
              )),
        ),
      ),
    );
  }
}
