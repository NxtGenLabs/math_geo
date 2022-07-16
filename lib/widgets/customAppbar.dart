import 'dart:async';

import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int timeLeft = 120;

  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.grey[400],
              title: const Text('Level'),
              content: const Text("question"),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _startCountDown();
                  },
                  child: Text('Attempt'),
                  color: Colors.teal,
                )
              ],
            );
          });
    }

    return Container(
      decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      margin: const EdgeInsets.only(top: 15),
      width: 800,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            color: Colors.grey[300],
          ),
          IconButton(
            icon: const Icon(Icons.check_circle),
            color: Colors.grey[300],
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_pin_circle_outlined),
            color: Colors.grey[300],
            onPressed: () {},
          ),
          Container(
            child: Text(
              timeLeft.toString(),
              style: TextStyle(color: Colors.grey[300]),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.question_mark),
            color: Colors.grey[300],
            onPressed: _showDialog,
          ),
        ],
      ),
    );
  }
}
