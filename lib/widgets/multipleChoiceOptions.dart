import 'package:flutter/material.dart';

class MultipleChoiceOptions extends StatelessWidget {
  final String pick;
  final Function(String) onPicked;

  MultipleChoiceOptions(@required this.pick, this.onPicked);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
            heroTag: "A",
            child: Text("A"),
            onPressed: () {
              onPicked("A");
            }),
        const SizedBox(width: 10),
        FloatingActionButton(
            heroTag: "B",
            child: Text("B"),
            onPressed: () {
              onPicked("B");
            }),
        const SizedBox(width: 10),
        FloatingActionButton(
            heroTag: "C",
            child: Text("C"),
            onPressed: () {
              onPicked("C");
            })
      ],
    );
  }
}
