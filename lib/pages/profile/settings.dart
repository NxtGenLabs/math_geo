import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/widgets/actionButton.dart';

import '../../themes/textStyles.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 255, 250),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(FontAwesomeIcons.chevronLeft)),
                  const SizedBox(width: 10),
                  const Text("Settings", style: ThemeText.chapter)
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(FontAwesomeIcons.moon)),
                const SizedBox(width: 10),
                const Text("Dark mode", style: ThemeText.chapter)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.volumeHigh)),
                const SizedBox(width: 10),
                const Text("Sound Effects", style: ThemeText.chapter)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.solidCircleQuestion)),
                const SizedBox(width: 10),
                const Text("Help", style: ThemeText.chapter)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(FontAwesomeIcons.phone)),
                const SizedBox(width: 10),
                const Text("Contacts", style: ThemeText.chapter)
              ],
            ),
            const SizedBox(height: 20),
            ActionButton(text: "LOGOUT", onPress: () {})
          ],
        ),
      ),
    );
  }
}
