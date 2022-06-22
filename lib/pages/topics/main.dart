import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/option.dart';

class Topics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Option(
                text: 'Transformations',
                route: () => Navigator.pushNamed(
                    context, './pages/topics/transformations/levels'))
          ],
        ),
      ),
    );
  }
}
