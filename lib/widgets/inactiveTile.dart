import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class InactiveTile extends StatelessWidget {
  final String subject;
  final String image;

  InactiveTile({required this.subject, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 217, 217, 217),
      height: 200,
      width: 200,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image(image: AssetImage(image)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 204, 204, 204),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(subject, style: ThemeText.world)),
          )
        ],
      ),
    );
  }
}
