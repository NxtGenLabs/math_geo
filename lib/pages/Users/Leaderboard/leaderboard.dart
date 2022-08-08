import 'package:flutter/material.dart';
import 'package:splash/Components/title.dart';
import 'package:splash/pages/Menu/homeMenu.dart';
import 'package:splash/pages/Users/Leaderboard/table.dart';

class Leaderbord extends StatefulWidget {
  const Leaderbord({Key? key}) : super(key: key);

  @override
  State<Leaderbord> createState() => _LeaderbordState();
}

class _LeaderbordState extends State<Leaderbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BackTitle(
            title: "Leaderboard",
            destination: HomeMenu(),
          ),
          // table(),
        ],
      ),
    );
  }
}
