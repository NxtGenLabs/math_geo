import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/pages/profile/leaderboard.dart';
import 'package:math_geometry/themes/textStyles.dart';

import '../../themes/background.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _profile = Column(
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
              const Text("Profile", style: ThemeText.chapter)
            ],
          ),
        ),
        const SizedBox(height: 60),
        const Icon(
          FontAwesomeIcons.solidCircleUser,
          size: 150,
        ),
        const SizedBox(height: 20),
        const Text(
          "David Blane",
          style: ThemeText.header2,
        ),
        const SizedBox(height: 5),
        const Text("130,000 points", style: ThemeText.normal),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromARGB(255, 235, 246, 229)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Info", style: ThemeText.chapter),
                Text("Badges", style: ThemeText.chapter)
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromARGB(255, 235, 246, 229)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Personal Information",
                  style: ThemeText.chapter,
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text("FullName: ", style: ThemeText.small),
                    Text("David Blane", style: ThemeText.smallBold),
                    SizedBox(width: 10),
                    Text("Age: ", style: ThemeText.small),
                    Text("21", style: ThemeText.smallBold),
                    SizedBox(width: 10),
                    Text("Gender: ", style: ThemeText.small),
                    Text("Male", style: ThemeText.smallBold),
                  ],
                ),
                const SizedBox(height: 60),
                const Text(
                  "Personal Statistics",
                  style: ThemeText.chapter,
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text("Position: ", style: ThemeText.small),
                    Text("1", style: ThemeText.smallBold),
                    SizedBox(width: 10),
                    Text("Total Time Spent: ", style: ThemeText.small),
                    Text("72min", style: ThemeText.smallBold),
                    SizedBox(width: 10),
                    Text("Avg Time Spent: ", style: ThemeText.small),
                    Text("3mins", style: ThemeText.smallBold),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text("Levels Completed: ", style: ThemeText.small),
                    Text("7 Levels", style: ThemeText.smallBold),
                    SizedBox(width: 10),
                    Text("Total Scores: ", style: ThemeText.small),
                    Text("250000", style: ThemeText.smallBold),
                    SizedBox(width: 10),
                    Text("Stars: ", style: ThemeText.small),
                    Text(
                      "4.2",
                      style: ThemeText.smallBold,
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );

    final tabs = [_profile, Leaderboard()];

    return Scaffold(
      body: SafeArea(
        child: Background(child: tabs[_currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color.fromARGB(255, 235, 246, 229),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'Profile', icon: Icon(FontAwesomeIcons.solidCircleUser)),
            BottomNavigationBarItem(
                label: 'Scores', icon: Icon(FontAwesomeIcons.trophy))
          ]),
    );
  }
}
