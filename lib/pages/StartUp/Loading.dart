import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:splash/Components/Background/particles.dart';
import 'package:splash/pages/StartUp/startMenu.dart';
import 'package:splash/pages/Useless/splash.dart';

class Load extends StatefulWidget {
  Load({Key? key}) : super(key: key);

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => StartMenu()));
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: const Text(
              "NXTGEN MINDS",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 28,
            width: currentWidth / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(255, 98, 166, 62),
                  width: 2,
                )),
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              width: currentWidth / 2 - 4,
              lineHeight: 24,
              percent: 1.0,
              progressColor: const Color.fromARGB(255, 98, 166, 62),
              backgroundColor: Colors.white,
              barRadius: const Radius.circular(20),
              padding: const EdgeInsets.all(2.0),
            ),
          ),
        ],
      )),
    );
  }
}
