import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';

class MyParticle extends StatefulWidget {
  @override
  _MyParticleState createState() => new _MyParticleState();
}

class _MyParticleState extends State<MyParticle> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                // decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //         begin: Alignment.topRight,
                //         end: Alignment.bottomLeft,
                //         colors: [Color(0xFF161C32), Color(0xFF373B44)])),
                child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: new Particles(40, Colors.grey),
                  ),
                ),
              ],
            ))));
  }
}
