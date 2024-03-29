import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/inactiveTile.dart';

import '../../widgets/tile.dart';

class Classes extends StatelessWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List tiles = [
      Tile(
          subject: "Mathematics",
          onPressed: () async {
            final player = AudioPlayer();
            await player.play(AssetSource('satisfying_click.wav'));
            Navigator.pushNamed(context, './pages/topics/main');
          }),
      const InactiveTile(
          subject: "Agriculture", image: "images/agriculture.png"),
      const InactiveTile(subject: "Biology", image: "images/biology.png"),
      const InactiveTile(subject: "Physics", image: "images/physics.png")
    ];

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(20))),
                  height: 150,
                  width: width,
                  child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage("images/savannah_cropped.png")),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, './pages/profile/profile');
                              },
                              icon: const Icon(FontAwesomeIcons.solidCircleUser,
                                  color: Color.fromARGB(255, 60, 64, 58),
                                  size: 30)),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, './pages/profile/settings');
                              },
                              icon: const Icon(FontAwesomeIcons.gear,
                                  size: 30,
                                  color: Color.fromARGB(255, 60, 64, 58))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Welcome, Dude!", style: ThemeText.header2),
                          Text("Let's get started upgrading your skills",
                              style: ThemeText.normal)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          labelStyle: ThemeText.chapter,
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          labelPadding: const EdgeInsets.only(
                              left: 30, right: 20, bottom: 10, top: 10),
                          indicator: Indicator(),
                          tabs: const [
                            Tab(text: "Form 1"),
                            Tab(text: "Form 2"),
                            Tab(text: "Form 3"),
                            Tab(text: "Form 4")
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    height: height - 225,
                    child: TabBarView(children: [
                      const Center(
                          child: Text("Nothing to show here.",
                              style: ThemeText.normal)),
                      const Center(
                          child: Text("Nothing to show here.",
                              style: ThemeText.normal)),
                      MasonryGridView.count(
                          padding: const EdgeInsets.all(20),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          itemCount: tiles.length,
                          crossAxisCount: width ~/ 300,
                          itemBuilder: (context, index) {
                            return tiles[index];
                          }),
                      const Center(
                          child: Text(
                        "Nothing to show here.",
                        style: ThemeText.normal,
                      )),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class Indicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TabUnderline();
  }
}

class _TabUnderline extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..strokeWidth = 3
      ..color = Colors.black;

    Offset underlineOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height);

    canvas.drawLine(Offset(underlineOffset.dx - 18, underlineOffset.dy - 10),
        Offset(underlineOffset.dx + 25, underlineOffset.dy - 10), paint);
  }
}
