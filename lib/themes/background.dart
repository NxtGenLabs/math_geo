import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color.fromARGB(255, 252, 255, 250),
      width: double.infinity,
      height: size.height,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            height: 200,
            width: 200,
            child: Align(
              alignment: Alignment.topLeft,
              child: Particles(50, const Color.fromARGB(127, 242, 242, 242)),
            ),
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Particles(50, const Color.fromARGB(127, 217, 217, 217)),
            ),
          ),
          // Container(
          //   child: Positioned(
          //     bottom: -100,
          //     left: -100,
          //     child: Image.asset(
          //       "assets/images/Matrix.png",
          //       width: size.width,
          //     ),
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}
