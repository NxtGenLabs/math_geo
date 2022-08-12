import 'package:flutter/material.dart';

import '../services/auth.dart';
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("images/icons/profile.png")),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.settings)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
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
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Let's Start", style: ThemeText.level),
                      SizedBox(height: 10),
                      Center(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, './pages/classes/classes');
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                child: const Image(
                                    image:
                                        AssetImage("images/icons/arrow.png")),
                              )))
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
