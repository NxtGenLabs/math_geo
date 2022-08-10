import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/worldTile.dart';

class Transformations extends StatelessWidget {
  final List _worlds = [
    WorldTile(
        image: "images/training_station.png",
        title: "Training Station",
        color: const Color.fromARGB(255, 204, 205, 251),
        onPress: () {}),
    WorldTile(
        image: "images/the_field.png",
        title: "The Field",
        color: const Color.fromARGB(255, 106, 117, 21),
        onPress: () {}),
    WorldTile(
        image: "images/the_lake.png",
        title: "The Lake",
        color: const Color.fromARGB(255, 244, 181, 168),
        onPress: () {})
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage("images/math-set.jpg"))),
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
                        child: Text("World Select"),
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
