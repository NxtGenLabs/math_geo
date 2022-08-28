import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/chapterTile.dart';

class Topics extends StatefulWidget {
  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final List<Widget> _chapterTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addChapters();
    });
  }

  void _addChapters() {
    List<ChapterTile> chapters = [
      const ChapterTile(
        chapter: "1. Quadratic expressions and equations II.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "2. Irrational numbers.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "3. Circles I: Chord properties of a circle.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "4. Algebraic fractions.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "5. Sets II.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "6. Mapping and functions.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "7. Circle II: Angle properties of a circle.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "8. Transformations.",
        isActive: true,
      ),
      const ChapterTile(
        chapter: "9. Exponential and logarithimic functions.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "10. Change of subject of the formula.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "11. Trigonometry 1.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "12. Similarity II.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "13. Coordinate Geometry.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "14. Variation.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "15. Inequalities.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "16. Graphs of quadratic functions.",
        isActive: false,
      ),
      const ChapterTile(
        chapter: "17. Statistics II.",
        isActive: false,
      ),
    ];

    Future ft = Future(() {});

    for (var chapter in chapters) {
      ft = ft.then(
          (value) => Future.delayed(const Duration(milliseconds: 100), () {
                _chapterTiles.add(ChapterTile(
                    chapter: chapter.chapter, isActive: chapter.isActive));
                _listKey.currentState?.insertItem(_chapterTiles.length - 1);
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    Tween<Offset> offset =
        Tween(begin: const Offset(1, 0), end: const Offset(0, 0));

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                        width: width,
                        height: height / 2.5,
                        child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/math-set.png"))),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () async {
                                final player = AudioPlayer();
                                await player
                                    .play(AssetSource('satisfying_click.wav'));
                                Navigator.pop(context);
                              },
                              color: const Color.fromARGB(255, 248, 252, 246),
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
                  height: height / 1.4,
                  width: width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(50),
                          topEnd: Radius.circular(50))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text("Chapters", style: ThemeText.header2),
                      ),
                      Expanded(
                        child: AnimatedList(
                          key: _listKey,
                          initialItemCount: _chapterTiles.length,
                          itemBuilder: (context, index, animation) {
                            return SlideTransition(
                              position: animation.drive(offset),
                              child: _chapterTiles[index],
                            );
                          },
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
