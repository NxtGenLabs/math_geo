import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class ChapterTile extends StatelessWidget {
  final String chapter;
  final onPress;
  final bool isActive;

  const ChapterTile(
      {required this.chapter, this.onPress, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isActive) {
          final player = AudioPlayer();
          await player.play(AssetSource('satisfying_click.wav'));
          Navigator.pushNamed(context, './pages/classes/transformations');
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromARGB(255, 230, 230, 230)),
        padding: const EdgeInsets.only(bottom: 8, left: 2, right: 2),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 80,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color.fromARGB(255, 252, 252, 252)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(isActive ? 0 : 10),
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color.fromARGB(255, 217, 217, 217)),
                      child: Image(
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          image: AssetImage(isActive
                              ? "images/active_chapter.png"
                              : "images/lock.png"))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(chapter, style: ThemeText.chapter),
                  ),
                ],
              ),
              const Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}
