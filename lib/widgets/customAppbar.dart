import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/multipleChoiceOptions.dart';

class CustomAppBar extends StatefulWidget {
  final String level;
  final String question;
  final String answer;
  final String pick;
  CustomAppBar(this.level, this.question, this.answer,this.pick);

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
              title: Text('Level ${widget.level}'),
              content: Text(widget.question),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _startCountDown();
                      },
                      child: Text('Attempt'),
                      color: Colors.teal,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Quit'),
                      color: Colors.red[800],
                    )
                  ],
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
          Text(
            timeLeft.toString(),
            style: TextStyle(color: Colors.grey[300]),
          ),
          IconButton(
            icon: const Icon(Icons.question_mark),
            color: Colors.grey[300],
            onPressed: _showDialog,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.lightbulb_outline),
            color: Colors.grey[300],
          ),
          IconButton(
            icon: const Icon(Icons.person_pin_circle_outlined),
            color: Colors.grey[300],
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            color: Colors.grey[300],
            onPressed: () {
              if(widget.pick == widget.answer){
                print("Correct");
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            color: Colors.grey[300],
            onPressed: () {},
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.home_outlined),
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
