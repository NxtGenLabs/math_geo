import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:math_geometry/pages/topics/transformations/level/trainingStation/training_station.dart';
import 'package:math_geometry/pages/topics/transformations/menus/beginner_level.dart';
import 'package:math_geometry/pages/topics/transformations/menus/intermediate_level.dart';
import 'package:math_geometry/pages/topics/transformations/menus/training_station_level.dart';
import 'package:math_geometry/pages/wrapper.dart';
import 'pages/topics/main.dart';
import 'pages/topics/transformations/level/beginner.dart';
import 'pages/topics/transformations/level/intermediate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: Wrapper(),
    routes: {
      './pages/topics/main': (context) => Topics(),
      './pages/topics/transformations/menus/training_station_level':
          (context) => TrainingStationLevel(),
      './pages/topics/transformations/menus/beginner_level': (context) =>
          BeginnerLevel(),
      './pages/topics/transformations/menus/intermediate_level': (context) =>
          TransFormationsLevels(),
      './pages/topics/transformations/level/training_station': (context) =>
          const TrainingStation(),
      './pages/topics/transformations/level/beginner': (context) => Beginner(),
      './pages/topics/transformations/level/intermediate': (context) =>
          const Intermediate(),
    },
  ));
}
