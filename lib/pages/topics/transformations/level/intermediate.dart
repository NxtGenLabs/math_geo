import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/customAppbar.dart';
import 'package:math_geometry/widgets/toolbar.dart';
import '../../../../canvas/painter.dart';
import '../../../../canvas/grid.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import '../menus/intermediate_level.dart';

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
  double _previousScale = 1.0;

  void onPanStart(DragStartDetails details) {
    linePainter.startStroke(details.localPosition);
  }

  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    linePainter = LinePainter();
  }

  @override
  Widget build(BuildContext context) {
    final level = ModalRoute.of(context)!.settings.arguments as IntermediateLs;

    void _showDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.grey[400],
              title: Text('Level ${level.level}'),
              content: Text(level.question),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Attempt'),
                  color: Colors.teal,
                )
              ],
            );
          });
    }

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
                  color: Colors.grey[400],
                  height: double.infinity,
                  width: double.infinity,
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform:
                        Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
                    child: CustomPaint(
                      foregroundPainter: linePainter,
                      child: Visibility(
                        child: const MyGrid(),
                        visible: isVisible,
                      ),
                    ),
                  )),
            ),
          ),
          CustomAppBar(level.level, level.question, level.answer,'', '')
        ],
      ),
    );
  }
}
