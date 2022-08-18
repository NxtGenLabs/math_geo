import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/appbarIcon.dart';

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
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  int initTime = 0;
  int retries = 0;
  bool isStartTimer = false;
  bool isCorrect = false;
  bool usedHint = false;
  bool selected = false;

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

    Future.delayed(Duration.zero, () async {
      final player = AudioPlayer();
      await player.play(AssetSource('popup.wav'));
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
    void _showDialog() async {
      final player = AudioPlayer();
      await player.play(AssetSource('popup.wav'));
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
    void _showHint() async {
      final player = AudioPlayer();
      await player.play(AssetSource('hint.wav'));
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
          margin: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 50,
          width: 400,
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
                    height: 35,
                    width: 1,
                    color: const Color.fromARGB(255, 60, 64, 58),
                  )
                ],
              ),
              AppBarIcon('question.png', () {
                _showDialog();
              }),
              AppBarIcon('hint.png', () {
                _showHint();
                usedHint = true;
              }),
              const SizedBox(
                height: 50,
                width: 50,
              ),
              AppBarIcon('checkmark.png', () async {
                if (widget.pick == widget.answer) {
                  widget.score++;
                  setState(() {
                    isStartTimer = true;
                    isCorrect = true;
                  });
                } else {
                  final player = AudioPlayer();
                  await player.play(AssetSource('wrong.wav'));
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
              }),
              AppBarIcon('retry.png', () {}),
              AppBarIcon('home.png', () async {
                final player = AudioPlayer();
                await player.play(AssetSource('click.wav'));
                Navigator.pop(context);
              })
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(10),
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(60))),
          child: const Image(
              filterQuality: FilterQuality.high,
              image: AssetImage("images/characters/male_character.png")),
        )
      ],
    );
  }
}
