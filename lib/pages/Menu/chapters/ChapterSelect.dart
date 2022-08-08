import 'package:flutter/material.dart';
import 'package:splash/pages/Menu/Components/Background.dart';
import 'package:splash/pages/Menu/Worlds/worldSelect.dart';
import 'package:splash/pages/Menu/chapters/chapter.dart';

class ChapterSelect extends StatefulWidget {
  const ChapterSelect({Key? key}) : super(key: key);

  @override
  State<ChapterSelect> createState() => _ChapterSelectState();
}

class _ChapterSelectState extends State<ChapterSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuBackground(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Chapter(
                title: "check",
                destination: WorldSelect(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
