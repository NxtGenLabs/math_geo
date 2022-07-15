import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {

  int timeLeft = 120;

  void _startCountDown(){
    Timer.periodic(Duration(seconds: 1), (timer) { 
      setState(() {
        timeLeft--;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(timeLeft.toString())
    );
    
  }
}