import 'package:flutter/material.dart';
import 'package:splash/pages/Menu/Components/Background.dart';
import 'package:splash/pages/Menu/Levels/levelSelect.dart';
import 'package:splash/pages/Menu/Worlds/world.dart';

class WorldSelect extends StatefulWidget {
  const WorldSelect({Key? key}) : super(key: key);

  @override
  State<WorldSelect> createState() => _WorldSelectState();
}

class _WorldSelectState extends State<WorldSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuBackground(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              World(
                title: "check",
                destination: LevelSelect(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
