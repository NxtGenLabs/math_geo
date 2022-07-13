import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MultipleChoiceOptions extends StatelessWidget {
  const MultipleChoiceOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(heroTag: "A", child: Text("A"), onPressed: () {}),
        SizedBox(width: 10),
        FloatingActionButton(heroTag: "B", child: Text("B"), onPressed: () {}),
        SizedBox(width: 10),
        FloatingActionButton(heroTag: "C", child: Text("C"), onPressed: () {})
      ],
    );
  }
}
