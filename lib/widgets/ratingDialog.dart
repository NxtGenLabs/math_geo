import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class RatingDialog extends StatefulWidget {
  final int score;
  final int time;

  const RatingDialog(this.score, this.time);
  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double customScale = 0;
  double customScale2 = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [
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
                  filterQuality: FilterQuality.high,
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
                filterQuality: FilterQuality.high,
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
                  filterQuality: FilterQuality.high,
                  image: AssetImage('images/icons/star.png'))),
        ),
      ),
    ];
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'YOU WIN!!',
                    style: ThemeText.header2,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Score: ",
                            style: ThemeText.title,
                          ),
                          Text(
                            "${((widget.score * 3) / 4.toInt()).round()}",
                            style: ThemeText.header2,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Time Left: ", style: ThemeText.title),
                          Text(
                            "${widget.time}",
                            style: ThemeText.header2,
                          ),
                          const Text(
                            "s",
                            style: ThemeText.title,
                          )
                        ],
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
            child: SizedBox(
              height: 75,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: ((widget.score * 3) / 4).round(),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        stars[index],
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
