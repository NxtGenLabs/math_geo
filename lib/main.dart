import 'package:flutter/material.dart';
import 'package:math_geometry/pages/landing.dart';
import 'package:math_geometry/pages/topics/transformations/level/training_station.dart';
import 'package:math_geometry/pages/topics/transformations/menus/beginner_level.dart';
import 'package:math_geometry/pages/topics/transformations/menus/training_station_level.dart';
import 'pages/topics/main.dart';
import 'pages/topics/transformations/level/beginner.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: LandingPage(),
      routes: {
        './pages/landing': (context) => LandingPage(),
        './pages/topics/main': (context) => Topics(),
        './pages/topics/transformations/levels/training_station_level':
            (context) => TrainingStationLevels(),
        './pages/topics/transformations/levels/beginner_level': (context) =>
            TransFormationsLevels(),
        './pages/topics/transformations/levels/training_station': (context) =>
            TrainingStation(),
        './pages/topics/transformations/beginner': (context) =>
            const Beginner(),
      },
    ));
