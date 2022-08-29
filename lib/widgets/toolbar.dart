import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/widgets/tool.dart';

class ToolBar extends StatelessWidget {
  final void Function() onClick;
  final void Function() delete;
  final void Function() zoomIn;
  final void Function() zoomOut;

  const ToolBar(
      {required this.onClick,
      required this.delete,
      required this.zoomIn,
      required this.zoomOut});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(alignment: AlignmentDirectional.topCenter, children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
            width: 300,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Color.fromARGB(255, 45, 46, 47)),
          ),
          Row(
            children: [
              Tool(FontAwesomeIcons.maximize, zoomIn),
              const SizedBox(width: 10),
              Tool(FontAwesomeIcons.minimize, zoomOut),
              const SizedBox(
                width: 10,
              ),
              Tool(FontAwesomeIcons.slash, () {}),
              const SizedBox(width: 10),
              Tool(FontAwesomeIcons.drawPolygon, () {}),
              const SizedBox(width: 10),
              Tool(FontAwesomeIcons.trash, delete),
            ],
          )
        ]),
      ],
    );
  }
}
