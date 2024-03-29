import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/appbarIcon.dart';
import 'package:math_geometry/widgets/customDialog.dart';
import 'package:math_geometry/widgets/ratingDialog.dart';

class CustomAppBar extends StatefulWidget {
  final String level;
  final String question;
  final answer;
  final String pick;
  final offsets;
  final String hint;
  int timeLimit;
  int score;
  final retry;
  final target;
  final Function onUpdateScore;
  CustomAppBar(
      {required this.level,
      required this.question,
      required this.answer,
      required this.pick,
      required this.hint,
      required this.score,
      required this.onUpdateScore,
      required this.timeLimit,
      this.retry,
      this.target,
      this.offsets,
      Key? key});

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
  List<Offset> calPts = [];

///////////timer function
  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        widget.timeLimit--;
      });
      if (isStartTimer) {
        timer.cancel();
      }
    });
  }

  //submit score to firebase
  void submitScore() {
    var database = FirebaseFirestore.instance;
    database.collection('Scores').add({
      "Level": widget.level,
      "Score": widget.score,
      "Time": widget.timeLimit
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () async {
      final player = AudioPlayer();
      await player.play(AssetSource('popup.wav'));
      showDialog(
          context: context,
          builder: (context) {
            return CustomDialog(
                title: 'Level ${widget.level}',
                clsBtnTitle: 'Quit',
                onClsBtnPressed: () async {
                  final player = AudioPlayer();
                  await player.play(AssetSource('satisfying_click.wav'));
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                message: widget.question,
                attempt: true,
                header: FontAwesomeIcons.question,
                headerColor: Colors.purple,
                secBtnTitle: 'Attempt',
                secOnPress: () async {
                  final player = AudioPlayer();
                  await player.play(AssetSource('satisfying_click.wav'));
                  Navigator.pop(context);
                  _startCountDown();
                });
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    double centerX = MediaQuery.of(context).size.width / 2;
    double centerY = MediaQuery.of(context).size.height / 2;

    void _showDialog() async {
      final player = AudioPlayer();
      await player.play(AssetSource('popup.wav'));
      showDialog(
          context: context,
          builder: (context) {
            return CustomDialog(
              title: 'Level${widget.level}',
              clsBtnTitle: 'Close',
              onClsBtnPressed: () {
                Navigator.pop(context);
              },
              message: widget.question,
              attempt: false,
              header: FontAwesomeIcons.question,
              headerColor: Colors.purple,
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
            return CustomDialog(
                title: "Hint",
                message: widget.hint,
                clsBtnTitle: "Close",
                onClsBtnPressed: () {
                  Navigator.pop(context);
                },
                attempt: false,
                header: FontAwesomeIcons.solidLightbulb,
                headerColor: Colors.amber);
          });
    }

//////dialog on submit, plus checks if answer is right or wrong
    void _showResult() async {
      if (isCorrect) {
        final player = AudioPlayer();
        await player.play(AssetSource('pad_confirm.wav'));
        showDialog(
            context: context,
            builder: (context) {
              return RatingDialog(widget.score, widget.timeLimit);
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return CustomDialog(
                header: FontAwesomeIcons.x,
                headerColor: Colors.red,
                title: "Wrong",
                message: "Ooo!! You just missed it, try again.",
                attempt: true,
                clsBtnTitle: "Quit",
                onClsBtnPressed: () async {
                  final player = AudioPlayer();
                  await player.play(AssetSource('satisfying_click.wav'));
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                secBtnTitle: "Retry",
                secOnPress: () async {
                  final player = AudioPlayer();
                  await player.play(AssetSource('satisfying_click.wav'));
                  retries++;
                  Navigator.pop(context);
                },
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
                  SizedBox(
                    width: 35,
                    child: Text(
                      "${widget.timeLimit}s",
                      style: ThemeText.chapter,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 35,
                    width: 1,
                    color: const Color.fromARGB(255, 60, 64, 58),
                  )
                ],
              ),
              AppBarIcon(FontAwesomeIcons.question, () {
                _showDialog();
              }, Colors.purple),
              AppBarIcon(FontAwesomeIcons.lightbulb, () {
                _showHint();
                usedHint = true;
              }, Colors.amber),
              const SizedBox(
                height: 50,
                width: 50,
              ),
              AppBarIcon(FontAwesomeIcons.check, () async {
                submitScore();
                if (widget.target != null) {
                  widget.target();

                  Future.delayed(const Duration(seconds: 4), () async {
                    if (widget.offsets != null) {
                      for (Offset point in widget.offsets) {
                        calPts.add(Offset(
                            (((point.dx - centerX) * 0.1) / 4).roundToDouble(),
                            (((point.dy - centerY) * -0.1) / 4)
                                .roundToDouble()));
                      }
                    }
                    if (widget.pick.toString() == widget.answer ||
                        calPts.toString() == widget.answer) {
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

                    if (widget.timeLimit > 0) {
                      widget.score++;
                    }
                    if (retries == 0) {
                      widget.score++;
                    }
                    if (!usedHint) {
                      widget.score++;
                    }
                  });
                } else {
                  if (widget.offsets != null) {
                    for (Offset point in widget.offsets) {
                      calPts.add(Offset(
                          (((point.dx - centerX) * 0.1) / 4).roundToDouble(),
                          (((point.dy - centerY) * -0.1) / 4).roundToDouble()));
                    }
                  }
                  if (widget.pick.toString() == widget.answer ||
                      calPts.toString() == widget.answer) {
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

                  if (widget.timeLimit > 0) {
                    widget.score++;
                  }
                  if (retries == 0) {
                    widget.score++;
                  }
                  if (!usedHint) {
                    widget.score++;
                  }
                }
              }, Colors.green),
              AppBarIcon(FontAwesomeIcons.repeat, widget.retry, Colors.grey),
              AppBarIcon(FontAwesomeIcons.x, () async {
                final player = AudioPlayer();
                await player.play(AssetSource('satisfying_click.wav'));
                Navigator.pop(context);
              }, Colors.red)
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
