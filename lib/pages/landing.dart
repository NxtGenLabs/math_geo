import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/option.dart';


class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: Option(
          text: 'PLAY',
          route: () => Navigator.pushNamed(context, './pages/topics/main') )
      ),
    );
  }
}