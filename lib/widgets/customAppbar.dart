import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/countdownTimer.dart';

class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        color: Colors.teal,
        width: MediaQuery.of(context).size.width -200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: ()=> Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
            IconButton(icon: const Icon(Icons.check_circle),onPressed: (){},),
            IconButton(icon: const Icon(Icons.person_pin_circle_outlined),onPressed: (){},),
            CountdownTimer(),
            IconButton(icon: const Icon(Icons.question_mark),onPressed: (){},),
          ],
        ),
      ),
    );
  }
}