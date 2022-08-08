import 'package:flutter/material.dart';
import 'package:splash/Components/Background/background.dart';
import 'package:splash/Components/Button/btn-green.dart';
import 'package:splash/Components/Button/btn-white.dart';
import 'package:splash/pages/Onboarding/onboarding.dart';
import '../Sign/SignIn/SignIn.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({Key? key}) : super(key: key);

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Background(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: size.height * 0.05),
            Container(
              width: currentWidth - 40,
              child: const Text(
                "Change Language | EN",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Container(
              width: currentWidth,
              alignment: Alignment(-0.3, 0),
              child: Image.asset(
                'assets/images/Robot-hi.png',
                // scale: 1.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Column(
              children: [
                Container(
                  width: currentWidth * 0.8,
                  child: const FittedBox(
                    child: Text(
                      "Welcome and Hello to the NXTGEN MINDS Programme",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  width: currentWidth * 0.6,
                  child: const FittedBox(
                    child: Text(
                      "Before we move, is this your first time here?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                BtnGreen(
                    title: 'YES, THIS IS MY FIRST TIME',
                    destination: Onboarding(),
                    isDestination: false,
                    fallback: true),
                BtnWhite(
                  title: 'NO, I HAVE BEEN HERE BEFORE',
                  destination: Login(),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
