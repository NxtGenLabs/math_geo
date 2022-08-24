import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color.fromARGB(255, 217, 217, 217)),
                child: IconButton(
                  color: const Color.fromARGB(255, 45, 46, 47),
                  onPressed: zoomIn,
                  icon: const Icon(FontAwesomeIcons.maximize),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color.fromARGB(255, 217, 217, 217)),
                child: IconButton(
                  color: const Color.fromARGB(255, 45, 46, 47),
                  onPressed: zoomOut,
                  icon: const Icon(FontAwesomeIcons.minimize),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color.fromARGB(255, 217, 217, 217)),
                child: const IconButton(
                  color: Color.fromARGB(255, 45, 46, 47),
                  onPressed: _tapped,
                  icon: Icon(FontAwesomeIcons.drawPolygon),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color.fromARGB(255, 217, 217, 217)),
                child: IconButton(
                  color: const Color.fromARGB(255, 45, 46, 47),
                  onPressed: delete,
                  icon: const Icon(FontAwesomeIcons.trash),
                ),
              )
            ],
          )
        ]),
      ],
    );
  }
}

void _tapped() {}
