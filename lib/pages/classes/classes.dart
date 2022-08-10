import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/inactiveTile.dart';
import 'package:math_geometry/widgets/tile.dart';

class Classes extends StatelessWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const SizedBox(
                  height: 200,
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
                            icon: const Icon(Icons.person_pin_circle)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.settings))
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Form 1"),
                    Text("Form 2"),
                    Text("Form 3"),
                    Text("Form 4"),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
          ],
        ),
      ),
    ));
  }
}
