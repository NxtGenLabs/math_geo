import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
            Container(
              child: Stack(
                children: [
                  const Image(image: AssetImage("images/savannah_cropped.png")),
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
                              onPressed: () {},
                              icon: const Icon(Icons.settings))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Welcome, Dude!"),
                          Text("Let's get started upgrading your skills")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
            StaggeredGrid.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 4,
              children: [
                StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: const Image(image: AssetImage("images/math.png")),
                    )),
                StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.7,
                    child: Container(
                        height: 200,
                        width: 200,
                        child: const Image(
                            image: AssetImage("images/physics.png")))),
                StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Container(
                        height: 200,
                        width: 200,
                        child: const Image(
                            image: AssetImage("images/biology.png")))),
                StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.7,
                    child: Container(
                        height: 200,
                        width: 200,
                        child: const Image(
                            image: AssetImage("images/agriculture.png"))))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
