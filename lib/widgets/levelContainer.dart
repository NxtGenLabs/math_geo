import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class LevelContainer extends StatelessWidget {
  final void Function() onPress;
  final String level;

  LevelContainer({required this.onPress, required this.level});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8, left: 2, right: 2),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromARGB(255, 98, 166, 62)),
        child: Container(
          height: 300,
          width: 100,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color.fromARGB(255, 113, 191, 71)),
          child: Center(child: Text(level, style: ThemeText.level)),
        ),
      ),
    );
  }
}
