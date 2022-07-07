import 'package:flutter/material.dart';
import 'package:math_geometry/pages/landing.dart';
import 'package:math_geometry/pages/topics/transformations/level/trainingStation/training_station.dart';
import 'package:math_geometry/pages/topics/transformations/menus/beginner_level.dart';
import 'package:math_geometry/pages/topics/transformations/menus/intermediate_level.dart';
import 'package:math_geometry/pages/topics/transformations/menus/training_station_level.dart';
import 'pages/topics/main.dart';
import 'pages/topics/transformations/level/beginner.dart';
import 'pages/topics/transformations/level/intermediate.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: LandingPage(),
      routes: {
        './pages/landing': (context) => LandingPage(),
        './pages/topics/main': (context) => Topics(),
<<<<<<< HEAD
        './pages/topics/transformations/menus/training_station_level':
            (context) => TrainingStationLevels(),
        './pages/topics/transformations/menus/beginner_level': (context) =>
            BeginnerLevel(),
        './pages/topics/transformations/menus/intermediate_level': (context) =>
            TransFormationsLevels(),
        './pages/topics/transformations/level/training_station': (context) =>
            TrainingStation(),
        './pages/topics/transformations/level/beginner': (context) =>
=======
        './pages/topics/transformations/levels/training_station_level':
            (context) => TrainingStationLevel(),
        './pages/topics/transformations/levels/beginner_level': (context) =>
            TransFormationsLevels(),
        './pages/topics/transformations/levels/training_station': (context) =>
            const TrainingStation(),
        './pages/topics/transformations/beginner': (context) =>
>>>>>>> 18cc1fb1448a178b3b5530e97ea0a5b596bb7488
            const Beginner(),
        './pages/topics/transformations/level/intermediate': (context) =>
            const Intermediate(),
      },
    ));
