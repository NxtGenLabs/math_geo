import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:splash/Components/Background/background.dart';
import 'package:splash/Components/Button/btn-back.dart';
import 'package:splash/Components/Button/btn-green.dart';
import 'package:splash/pages/Menu/homeMenu.dart';
import 'package:splash/pages/Settings/aboutUs.dart';
import 'package:splash/pages/Settings/contactUs.dart';
import 'package:splash/pages/Settings/help.dart';

import '../../Components/title.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackTitle(
              title: "Settings",
              destination: HomeMenu(),
            ),
            Column(
              children: [
                SettingOption(
                  title: "Music",
                  icon: Icons.music_note,
                  isLink: false,
                ),
                SettingOption(
                  title: "Sound Effects",
                  icon: Icons.volume_up,
                  isLink: false,
                ),
                SettingOption(
                  title: "Help",
                  icon: Icons.question_mark,
                  isLink: true,
                  destination: Help(),
                ),
                SettingOption(
                  title: "About Us",
                  icon: Icons.info,
                  isLink: true,
                  destination: AboutUs(),
                ),
                SettingOption(
                  title: "Contact Us",
                  icon: Icons.phone,
                  isLink: true,
                  destination: ContactUs(),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Column(
              children: [
                BtnGreen(
                    title: "Logout", isDestination: false, fallback: false),
                Text("Version 0.1.0"),
                Text("NXTGEN LABS"),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            // Stack(
            //   children: [
            //     CircularPercentIndicator(
            //       radius: 80,
            //       lineWidth: 20,
            //       percent: 0.6,
            //       progressColor: Colors.green[200],
            //       circularStrokeCap: CircularStrokeCap.round,
            //     ),
            //     CircularPercentIndicator(
            //       radius: 75,
            //       lineWidth: 5,
            //       percent: 0.5,
            //       progressColor: Colors.green[100],
            //       backgroundColor: Colors.transparent,
            //       circularStrokeCap: CircularStrokeCap.round,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class SettingOption extends StatelessWidget {
  SettingOption({
    Key? key,
    required this.title,
    required this.isLink,
    required this.icon,
    this.destination,
  }) : super(key: key);

  final String title;
  final bool isLink;
  final IconData icon;
  var destination;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: isLink
          ? () async {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => destination));
            }
          : () {},
      child: Container(
        height: size.height * 0.05,
        width: currentWidth,
        child: Row(
          children: [
            Container(
              width: currentWidth * 0.15,
              child: Icon(icon),
            ),
            Container(
              width: isLink ? currentWidth * 0.8 : currentWidth * 0.4,
              height: size.height * 0.03,
              alignment: Alignment(-1, 0),
              child: FittedBox(
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Center(
              child: isLink
                  ? Container()
                  : Container(
                      child: LiteRollingSwitch(
                        //initial value
                        value: true,
                        textOn: 'Sound on',
                        textOff: 'Sound',
                        colorOn: Color.fromARGB(255, 113, 191, 71),
                        colorOff: Color.fromARGB(255, 221, 42, 1),
                        iconOn: Icons.volume_up,
                        iconOff: Icons.volume_off,
                        textSize: 16.0,
                        onChanged: (bool state) {
                          //Use it to manage the different states
                          print('Current State of SWITCH IS: $state');
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
