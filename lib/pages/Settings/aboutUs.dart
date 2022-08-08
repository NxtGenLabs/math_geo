import 'package:flutter/material.dart';
import 'package:splash/Components/title.dart';
import 'package:splash/pages/Settings/setting.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BackTitle(
            title: "About Us",
            destination: const Settings(),
          ),
        ],
      ),
    );
  }
}
