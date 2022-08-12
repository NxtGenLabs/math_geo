import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/worldTile.dart';

class Transformations extends StatelessWidget {
  final List _worlds = [
    const WorldTile(
      image: "images/training_station.png",
      title: "Training Station",
      color: Color.fromARGB(255, 204, 205, 251),
      route: './pages/topics/transformations/menus/training_station_level',
    ),
    const WorldTile(
        image: "images/the_field.png",
        title: "The Field",
        color: Color.fromARGB(255, 106, 117, 21),
        route: './pages/topics/transformations/menus/beginner_level'),
    const WorldTile(
        image: "images/the_lake.png",
        title: "The Lake",
        color: Color.fromARGB(255, 244, 181, 168),
        route: './pages/topics/transformations/menus/intermediate_level')
  ];

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
                            child: const Text("Mathematics",
                                style: ThemeText.world),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Text("Transformations", style: ThemeText.levelHeader),
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
                        child: Text("World Select", style: ThemeText.header2),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: _worlds.length,
                            itemBuilder: (context, index) {
                              return _worlds[index];
                            }),
                      )
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
