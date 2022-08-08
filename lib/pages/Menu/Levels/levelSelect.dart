import 'package:flutter/material.dart';
import 'package:splash/pages/Menu/Components/Background.dart';
import 'package:splash/pages/Menu/Levels/level.dart';
import 'package:splash/pages/Menu/homeMenu.dart';

class LevelSelect extends StatefulWidget {
  const LevelSelect({Key? key}) : super(key: key);

  @override
  State<LevelSelect> createState() => _LevelSelectState();
}

class _LevelSelectState extends State<LevelSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuBackground(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Level(
                title: "1",
                destination: HomeMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
