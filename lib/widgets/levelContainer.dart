import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class LevelContainer extends StatelessWidget {
  final void Function() onPress;
  final String level;

  const LevelContainer({required this.onPress, required this.level});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(bottom: 8, left: 2, right: 2),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromARGB(255, 98, 166, 62)),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(255, 113, 191, 71)),
              child: Center(child: Text(level, style: ThemeText.level)),
            ),
          ),
          Positioned(
            top: -5,
            child: Container(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(height: 30, image: AssetImage("images/icons/star.png")),
                  Image(image: AssetImage("images/icons/star.png")),
                  Image(height: 30, image: AssetImage("images/icons/star.png")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
