import 'package:flutter/material.dart';

class IntroPg2 extends StatelessWidget {
  const IntroPg2({Key? key}) : super(key: key);

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
              "Solve real world problems",
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
              "Apply what you’ve learnt in real world situations, easily relatable to give you a better understanding of the reason for knowing.",
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
