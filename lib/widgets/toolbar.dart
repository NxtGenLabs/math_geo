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
        IconButton(
          color: Colors.teal,
          onPressed: zoomIn,
          icon: const Icon(Icons.zoom_in),
        ),
        const SizedBox(width: 10),
        IconButton(
          color: Colors.teal,
          onPressed: zoomOut,
          icon: const Icon(Icons.zoom_out),
        ),
        const SizedBox(width: 10),
        const IconButton(
          color: Colors.teal,
          onPressed: _tapped,
          icon: Icon(Icons.polyline),
        ),
        const SizedBox(width: 10),
        IconButton(
          color: Colors.teal,
          onPressed: delete,
          icon: const Icon(Icons.delete),
        ),
        const SizedBox(width: 10),
        IconButton(
          color: Colors.teal,
          onPressed: onClick,
          icon: const Icon(Icons.grid_4x4),
        ),
      ],
    );
  }
}

void _tapped() {}
