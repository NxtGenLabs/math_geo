import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/pick.dart';

class MultipleChoiceOptions extends StatelessWidget {
  final String pick;
  final Function(String) onPicked;

  const MultipleChoiceOptions(@required this.pick, this.onPicked);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 50,
              width: 220,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 60, 64, 50)),
            ),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pick("A", () {
                    onPicked("A");
                  }),
                  const SizedBox(width: 10),
                  Pick("B", () {
                    onPicked("B");
                  }),
                  const SizedBox(width: 10),
                  Pick("C", () {
                    onPicked("C");
                  })
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
