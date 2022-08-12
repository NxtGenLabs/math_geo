import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/chapterTile.dart';

import '../../../../../../widgets/activeChapterTile.dart';

class Topics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 33, 28),
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/math-set.png"))),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(FontAwesomeIcons.chevronLeft),
                              iconSize: 30),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 167, 45, 44)),
                            child: const Text("Form 3", style: ThemeText.world),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Text("Mathematics", style: ThemeText.levelHeader),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(50),
                          topEnd: Radius.circular(50))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Text("Chapters", style: ThemeText.header2),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            ChapterTile(
                                onPress: () {},
                                chapter:
                                    "8. Circle II: Angle properties of a circle."),
                            ActiveChapterTile(
                                onPress: () {
                                  Navigator.pushNamed(context,
                                      './pages/classes/transformations');
                                },
                                chapter: "9. Transformations."),
                            ChapterTile(
                                onPress: () {},
                                chapter:
                                    "10. Exponential and logarithimic functions"),
                            ChapterTile(
                                onPress: () {},
                                chapter: "11. Change of subject of the formula")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
