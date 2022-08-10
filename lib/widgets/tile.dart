import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class Tile extends StatelessWidget {
  final String subject;
  final void Function() onPressed;

  Tile({required this.subject, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: const Color.fromARGB(255, 111, 176, 198),
        height: 200,
        width: 200,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            const Image(image: AssetImage("images/math.png")),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 116, 204, 222),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(subject, style: ThemeText.world)),
            )
          ],
        ),
      ),
    );
  }
}
