import 'dart:async';
import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class CustomAppBar extends StatefulWidget {
  final String level;
  final String question;
  final String answer;
  final String pick;
  final String hint;
  final int timeLimit;
  int score;
  final Function onUpdateScore;
  CustomAppBar(this.level, this.question, this.answer, this.pick, this.hint,
      this.score, this.onUpdateScore, this.timeLimit);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int initTime = 0;
  int retries = 0;
  bool isStartTimer = false;
  bool isCorrect = false;
  bool usedHint = false;

///////////timer function
  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        initTime++;
      });
      if (isStartTimer) {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
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
                      color: Colors.teal,
                      child: const Text('Attempt'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      color: Colors.red[800],
                      child: const Text('Quit'),
                    )
                  ],
                )
              ],
            );
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.red[800],
                      child: const Text('Close'),
                    )
                  ],
                )
              ],
            );
          });
    }

////////hint function
    void _showHint() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.grey[400],
              title: const Text('Hint'),
              content: Text(widget.hint),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.red[800],
                  child: const Text('Close'),
                )
              ],
            );
          });
    }

//////dialog on submit, plus checks if answer is right or wrong
    void _showResult() {
      if (isCorrect) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.grey[400],
                title: const Text('Correct'),
                content: const Text("Good job!!"),
                actions: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    color: Colors.teal,
                    child: const Text('Next'),
                  )
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.grey[400],
                title: const Text('Wrong'),
                content: const Text("Ooo!! you just missed it, try again"),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          retries++;
                          Navigator.pop(context);
                        },
                        color: Colors.teal,
                        child: const Text('Retry'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.red[800],
                        child: const Text('Quit'),
                      )
                    ],
                  ),
                ],
              );
            });
      }
    }

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          margin: const EdgeInsets.only(top: 15),
          width: 600,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "${initTime}s",
                    style: ThemeText.header2,
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 50,
                    width: 1,
                    color: const Color.fromARGB(255, 60, 64, 58),
                  )
                ],
              ),
              GestureDetector(
                onTap: _showDialog,
                child: const SizedBox(
                    height: 40,
                    width: 40,
                    child:
                        Image(image: AssetImage("images/icons/question.png"))),
              ),
              GestureDetector(
                onTap: () {
                  _showHint();
                  usedHint = true;
                },
                child: const SizedBox(
                    height: 40,
                    width: 40,
                    child: Image(image: AssetImage("images/icons/hint.png"))),
              ),
              IconButton(
                icon: const Icon(Icons.person_pin_circle_outlined),
                color: Colors.grey[300],
                onPressed: () {},
              ),
              GestureDetector(
                onTap: () {
                  if (widget.pick == widget.answer) {
                    widget.score++;
                    setState(() {
                      isStartTimer = true;
                      isCorrect = true;
                    });
                  } else {
                    setState(() {
                      isCorrect = false;
                    });
                  }
                  _showResult();

                  if (initTime < widget.timeLimit) {
                    widget.score++;
                  }
                  if (retries == 0) {
                    widget.score++;
                  }
                  if (!usedHint) {
                    widget.score++;
                  }
                },
                child: const SizedBox(
                    height: 40,
                    width: 40,
                    child:
                        Image(image: AssetImage("images/icons/checkmark.png"))),
              ),
              GestureDetector(
                onTap: () {},
                child: const SizedBox(
                    height: 40,
                    width: 40,
                    child: Image(image: AssetImage("images/icons/retry.png"))),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                    height: 40,
                    width: 40,
                    child: Image(image: AssetImage("images/icons/home.png"))),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(20),
          height: 120,
          width: 120,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(60))),
          child: const Image(image: AssetImage("images/male_character.png")),
        )
      ],
    );
  }
}
