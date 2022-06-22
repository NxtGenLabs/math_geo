import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  final void Function() onClick;
  final void Function() delete;
  final void Function() zoomIn;
  final void Function() zoomOut;

  ToolBar(
      {required this.onClick,
      required this.delete,
      required this.zoomIn,
      required this.zoomOut});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: 'panIn',
          backgroundColor: Colors.teal,
          foregroundColor: const Color.fromARGB(224, 224, 224, 255),
          onPressed: zoomIn,
          child: const Icon(Icons.zoom_in),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: 'panOut',
          backgroundColor: Colors.teal,
          foregroundColor: const Color.fromARGB(224, 224, 224, 255),
          onPressed: zoomOut,
          child: const Icon(Icons.zoom_out),
        ),
        const SizedBox(width: 10),
        const FloatingActionButton(
          heroTag: 'draw',
          backgroundColor: Colors.teal,
          foregroundColor: Color.fromARGB(224, 224, 224, 255),
          onPressed: _tapped,
          child: Icon(Icons.polyline),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: 'delete',
          backgroundColor: Colors.teal,
          foregroundColor: const Color.fromARGB(224, 224, 224, 255),
          onPressed: delete,
          child: const Icon(Icons.delete),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: 'grid',
          backgroundColor: Colors.teal,
          foregroundColor: const Color.fromARGB(224, 224, 224, 255),
          onPressed: onClick,
          child: const Icon(Icons.grid_4x4),
        ),
      ],
    );
  }
}

void _tapped() {}
