import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class InactiveTile extends StatelessWidget {
  final String subject;
  final String image;

  const InactiveTile({required this.subject, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color.fromARGB(255, 217, 217, 217),
            ),
            child: Image(image: AssetImage(image))),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 204, 204, 204),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(subject, style: ThemeText.world)),
        )
      ],
    );
  }
}
