import 'package:flutter/material.dart';

class MultipleChoiceOptions extends StatefulWidget {
  String pick = '';
  @override
  State<MultipleChoiceOptions> createState() => _MultipleChoiceOptionsState();
}

class _MultipleChoiceOptionsState extends State<MultipleChoiceOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
            heroTag: "A",
            child: Text("A"),
            onPressed: () {
              setState(() {
                widget.pick = 'A';
              });
              print(widget.pick);
            }),
        const SizedBox(width: 10),
        FloatingActionButton(
            heroTag: "B",
            child: Text("B"),
            onPressed: () {
              setState(() {
                widget.pick = 'B';
              });
              print(widget.pick);
            }),
        const SizedBox(width: 10),
        FloatingActionButton(
            heroTag: "C",
            child: Text("C"),
            onPressed: () {
              widget.pick = 'C';
              print(widget.pick);
            })
      ],
    );
  }
}
