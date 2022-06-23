import 'package:flutter/material.dart';
import '../../../../widgets/option.dart';

class TrainingStationLevels extends StatelessWidget {
  const TrainingStationLevels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: GridView.builder(
          itemCount: 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height)),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Option(
                text: 'Level',
                route: () => Navigator.pushNamed(context,
                    './pages/topics/transformations/levels/training_station'),
              ),
            );
          }),
    );
  }
}
