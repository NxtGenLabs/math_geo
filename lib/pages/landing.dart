import 'package:flutter/material.dart';
import 'package:math_geometry/services/auth.dart';
import 'package:math_geometry/widgets/option.dart';

import '../themes/textStyles.dart';

class LandingPage extends StatelessWidget {
  final AuthService _auth = AuthService();

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
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person_pin_circle)),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Let's Start", style: ThemeText.level),
                    Center(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, './pages/classes/classes');
                          },
                          icon: const Icon(Icons.chevron_right)),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
