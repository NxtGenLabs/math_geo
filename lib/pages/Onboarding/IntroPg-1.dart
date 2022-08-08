import 'package:flutter/material.dart';

class IntroPg1 extends StatelessWidget {
  const IntroPg1({Key? key}) : super(key: key);

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
              "Learn hundreds of new skills",
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
              "Gain ton of new knowledge from many stem topics, each taught with step-by-step guiadance and assistance.",
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
