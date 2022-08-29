import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:math_geometry/themes/textStyles.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<String> quotes = [
    "`Obvious is the most dangerous word in mathematics.`",
    "Science has found that nothing can disappear without a trace. Nature does not know extinction. All its knows is TRANSFORMATION",
    "Math makes your life add up.",
    "Keep calm and do the math.",
    "The only way to learn mathematics is to do mathematics",
    "Geometry keeps you in shape.",
    "Parallel lines have so much in common, its a shame they'll never meet.",
    "Never argue with a 90 degree angle, its always right."
  ];

  List<String> images = [
    "images/trig.png",
    "images/mat_table.jpg",
    "images/mat_class.png"
  ];
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: height,
        width: width,
        color: const Color.fromARGB(255, 248, 252, 246),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50))),
              height: height * 0.75,
              child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(images[_random.nextInt(images.length)])),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 248, 252, 246),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(50))),
                height: height * 0.25 + 50,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpinKitFadingCube(
                      color: Color.fromARGB(255, 60, 64, 58),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      quotes[_random.nextInt(quotes.length)],
                      style: ThemeText.chapter,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
