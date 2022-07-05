import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/option.dart';

class BeginnerLevel extends StatelessWidget {
  const BeginnerLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      height: double.infinity,
      width: double.infinity,
      child: GridView.builder(
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height)),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Option(
                text: 'Level ${index + 1}',
                route: () => Navigator.pushNamed(
                    context, './pages/topics/transformations/level/beginner'),
              ),
            );
          }),
    );
  }
}
