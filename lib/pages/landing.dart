import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../themes/textStyles.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Image(
                  fit: BoxFit.cover, image: AssetImage("images/savannah.jpg")),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                              onPressed: () {},
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
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Let's Start", style: ThemeText.levelHeader),
                      Center(
                          child: IconButton(
                        icon: const Icon(FontAwesomeIcons.chevronDown,
                            size: 30,
                            color: Color.fromARGB(255, 248, 252, 246)),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, './pages/classes/classes');
                        },
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
