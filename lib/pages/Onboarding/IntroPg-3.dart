import 'package:flutter/material.dart';

class IntroPg3 extends StatelessWidget {
  const IntroPg3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Robot-hi.png',
              height: 300,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Interact in fun and engaging ways.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            const Text(
              "Built with game mechnics such leaderboards, scores and much more providing many interesting ways of challenging  and testing you, ensuring you grasp each topic better.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(63, 69, 69, 69),
              ),
            )
          ],
        ),
      ),
    );
  }
}
