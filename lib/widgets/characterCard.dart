import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class CharacterCard extends StatelessWidget {
  final String image;
  final String gender;

  const CharacterCard(this.image, this.gender);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: const Color.fromARGB(50, 105, 105, 105))),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    padding: const EdgeInsets.all(20.0),
                    child: Image(fit: BoxFit.contain, image: AssetImage(image)),
                  ),
                  Text(gender, style: ThemeText.normal)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
