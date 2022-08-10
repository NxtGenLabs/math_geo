import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/chapterTile.dart';

class Topics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage("images/math-set.jpg"))),
                const Text("Mathematics", style: ThemeText.levelHeader),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height / 1.5,
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
                      ChapterTile(
                          onPress: () {},
                          chapter:
                              "8. Circle II: Angle properties of a circle."),
                      ChapterTile(
                          onPress: () {
                            Navigator.pushNamed(
                                context, './pages/classes/transformations');
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
            )
          ],
        ),
      ),
    );
  }
}
