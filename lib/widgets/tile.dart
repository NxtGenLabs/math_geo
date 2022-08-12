import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class Tile extends StatelessWidget {
  final String subject;
  final void Function() onPressed;

  const Tile({required this.subject, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 111, 176, 198),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: const Image(
                fit: BoxFit.cover, image: AssetImage("images/math.png")),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 116, 204, 222),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(subject, style: ThemeText.world)),
          )
        ],
      ),
    );
  }
}
