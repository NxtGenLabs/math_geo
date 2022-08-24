import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';

class RatingDialog extends StatefulWidget {
  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double customScale = 0;
  double customScale2 = 0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Correct',
                    style: ThemeText.title,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TweenAnimationBuilder(
                        onEnd: () async {
                          final player = AudioPlayer();
                          await player.play(AssetSource('stars.wav'));
                          setState(() {
                            customScale = 1;
                          });
                        },
                        curve: Curves.elasticInOut,
                        duration: const Duration(milliseconds: 1000),
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context, dynamic scale, child) {
                          return Transform.scale(
                            scale: scale,
                            child: child,
                          );
                        },
                        child: Transform.rotate(
                          angle: 50,
                          child: const SizedBox(
                              height: 40,
                              child: Image(
                                  image: AssetImage('images/icons/star.png'))),
                        ),
                      ),
                      TweenAnimationBuilder(
                        onEnd: () async {
                          final player = AudioPlayer();
                          await player.play(AssetSource('stars.wav'));
                          setState(() {
                            customScale2 = 1;
                          });
                        },
                        curve: Curves.elasticInOut,
                        duration: const Duration(milliseconds: 1000),
                        tween: Tween<double>(begin: 0, end: customScale),
                        builder: (context, dynamic scale, child) {
                          return Transform.scale(
                            scale: scale,
                            child: child,
                          );
                        },
                        child: const SizedBox(
                            height: 70,
                            child: Image(
                                image: AssetImage('images/icons/star.png'))),
                      ),
                      TweenAnimationBuilder(
                        onEnd: () async {
                          final player = AudioPlayer();
                          await player.play(AssetSource('stars.wav'));
                        },
                        curve: Curves.elasticInOut,
                        duration: const Duration(milliseconds: 1000),
                        tween: Tween<double>(begin: 0, end: customScale2),
                        builder: (context, dynamic scale, child) {
                          return Transform.scale(
                            scale: scale,
                            child: child,
                          );
                        },
                        child: Transform.rotate(
                          angle: -50,
                          child: const SizedBox(
                              height: 40,
                              child: Image(
                                  image: AssetImage('images/icons/star.png'))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      onPressed: () async {
                        final player = AudioPlayer();
                        await player.play(AssetSource('satisfying_click.wav'));
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    )
                  ])
                ],
              ),
            ),
          ),
          Positioned(
            top: -40,
            child: TweenAnimationBuilder(
              curve: Curves.elasticInOut,
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 1000),
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child: Icon(
                  FontAwesomeIcons.check,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
