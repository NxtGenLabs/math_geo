import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

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
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 50,
              width: 300,
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
                  GestureDetector(
                    onTap: () {
                      onPicked("A");
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromARGB(255, 217, 217, 217)),
                      child: const Center(
                          child: Text("A", style: ThemeText.multipleChoice)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      onPicked("B");
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromARGB(255, 217, 217, 217)),
                      child: const Center(
                          child: Text("B", style: ThemeText.multipleChoice)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      onPicked("C");
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromARGB(255, 217, 217, 217)),
                      child: const Center(
                          child: Text(
                        "C",
                        style: ThemeText.multipleChoice,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
