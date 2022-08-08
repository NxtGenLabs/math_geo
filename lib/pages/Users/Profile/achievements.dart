import 'package:flutter/material.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Badge(
            image: 'assets/images/Nxt.png',
            title: "Champion",
            description: "Rank top of the Leaderboard",
          )
        ],
      ),
    );
  }
}

class Badge extends StatelessWidget {
  Badge({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color.fromARGB(64, 217, 217, 217),
        ),
        color: Color.fromARGB(255, 252, 255, 250),
      ),
      height: 100,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 80,
            height: 80,
            decoration: BoxDecoration(),
            child: Center(
              child: Image.asset(
                image,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            height: 80,
            width: size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.height * 0.4,
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.5,
                  child: Text(
                    description,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}
