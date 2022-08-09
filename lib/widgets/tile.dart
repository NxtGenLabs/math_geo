import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String subject;

  Tile({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Text(subject)),
          )
        ],
      ),
    );
  }
}
