import 'package:flutter/material.dart';

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
                  icon: const Icon(Icons.zoom_in),
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
                  icon: const Icon(Icons.zoom_out),
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
                  icon: Icon(Icons.polyline),
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
                  icon: const Icon(Icons.delete),
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
                  onPressed: onClick,
                  icon: const Icon(Icons.grid_4x4),
                ),
              ),
            ],
          )
        ]),
      ],
    );
  }
}

void _tapped() {}
