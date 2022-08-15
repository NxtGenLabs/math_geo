import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../themes/textStyles.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

final List<Stats> stats = [
  Stats("Eugene Maseya", 200000),
  Stats("Nara Kalea", 155000),
  Stats("Bright Nthara", 130000),
  Stats("Natasha Phaya", 115000),
  Stats("George Phiri", 80000),
  Stats("Fortune Nkhungula", 75000)
];

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(FontAwesomeIcons.chevronLeft)),
                const SizedBox(width: 10),
                const Text("Leaderboard", style: ThemeText.chapter)
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: const TabBar(
                      labelStyle: ThemeText.chapter,
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      labelPadding: EdgeInsets.only(
                          left: 30, right: 20, bottom: 10, top: 10),
                      tabs: [
                        Tab(text: "Daily"),
                        Tab(text: "Weekly"),
                        Tab(text: "Monthly"),
                        Tab(text: "Of All Time")
                      ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 220,
                  child: TabBarView(children: [
                    ListView.builder(
                        itemCount: stats.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: const Color.fromARGB(255, 250, 250, 250),
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text((index + 1).toString()),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                    Text(
                                      stats[index].name,
                                      style: ThemeText.normal,
                                    ),
                                  ],
                                ),
                                Text(
                                  stats[index].score.toString(),
                                  style: ThemeText.normal,
                                )
                              ],
                            ),
                          );
                        }),
                    Text("2"),
                    Text("3"),
                    Text("4")
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Stats {
  String name;
  int score;

  Stats(this.name, this.score);
}
