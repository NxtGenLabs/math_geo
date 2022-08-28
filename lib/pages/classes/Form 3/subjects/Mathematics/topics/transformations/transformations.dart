import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/worldTile.dart';

class Transformations extends StatefulWidget {
  @override
  State<Transformations> createState() => _TransformationsState();
}

class _TransformationsState extends State<Transformations> {
  final List _worldTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addWorlds();
    });
  }

  void _addWorlds() {
    List<WorldTile> worlds = [
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
          route: './pages/topics/transformations/menus/intermediate_level'),
      const WorldTile(
          image: "images/the_lake.png",
          title: "The City",
          color: Colors.red,
          route: './pages/topics/transformations/menus/advanced_level'),
    ];

    Future ft = Future(() {});

    for (var world in worlds) {
      ft = ft.then(
          (value) => Future.delayed(const Duration(milliseconds: 100), () {
                _worldTiles.add(WorldTile(
                  image: world.image,
                  title: world.title,
                  color: world.color,
                  route: world.route,
                ));
                _listKey.currentState?.insertItem(_worldTiles.length - 1);
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
                            filterQuality: FilterQuality.high,
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
                  height: height / 1.3,
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
                        child: Text("World Select", style: ThemeText.header2),
                      ),
                      Expanded(
                        child: AnimatedList(
                            key: _listKey,
                            initialItemCount: _worldTiles.length,
                            itemBuilder: (context, index, animation) {
                              return SlideTransition(
                                child: _worldTiles[index],
                                position: animation.drive(offset),
                              );
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
