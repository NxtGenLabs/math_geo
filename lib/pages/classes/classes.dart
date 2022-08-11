import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:math_geometry/themes/textStyles.dart';

import '../../widgets/inactiveTile.dart';
import '../../widgets/tile.dart';

class Classes extends StatelessWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const SizedBox(
                  height: 150,
                  child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage("images/savannah_cropped.png")),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person_pin_circle), iconSize: 40, color: const Color.fromARGB(255, 60, 64, 58)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.settings), iconSize: 40, color: const Color.fromARGB(255, 60, 64, 58))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
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
                children:  [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelStyle: ThemeText.chapter,
                        isScrollable: true,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelPadding: const EdgeInsets.only(left: 30, right: 20, bottom: 10, top: 10),
                        indicator: Indicator(),
                        tabs: const [Tab(text: "Form 1"), Tab(text: "Form 2"),Tab(text: "Form 3"), Tab(text: "Form 4")]),
                    ),
                  ),
                  Expanded(
                child: TabBarView(children: [
                  const Text("1"),
                  const Text("2"),
                  Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 30),
              child: StaggeredGrid.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 4,
                children: [
                  StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: Tile(
                        subject: "Mathematics",
                        onPressed: () {
                          Navigator.pushNamed(context, './pages/topics/main');
                        },
                      )),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.7,
                      child: InactiveTile(
                        subject: "Physics",
                        image: "images/physics.png",
                      )),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: InactiveTile(
                        subject: "Biology",
                        image: "images/biology.png",
                      )),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.7,
                      child: InactiveTile(
                          subject: "Agriculture",
                          image: "images/agriculture.png"))
                ],
              ),
            ),
                  const Text("4")
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


class Indicator extends Decoration{
  
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]){
    return _TabUnderline();
  }
}

class _TabUnderline extends BoxPainter {

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg){
    Paint paint = Paint()
    ..strokeWidth = 3
    ..color = Colors.black;

    Offset underlineOffset = offset + Offset(cfg.size!.width / 2, cfg.size!.height);

    canvas.drawLine(Offset(underlineOffset.dx - 18,underlineOffset.dy - 10), Offset(underlineOffset.dx + 25,underlineOffset.dy - 10), paint);
  }
}