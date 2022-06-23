import 'package:flutter/material.dart';
import 'package:math_geometry/pages/landing.dart';
import 'package:math_geometry/pages/topics/transformations/levels/beginner_level.dart';
import 'package:math_geometry/pages/topics/transformations/levels/training_station.dart';
import 'pages/topics/main.dart';
import 'pages/topics/transformations/main.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: LandingPage(),
      routes: {
        './pages/landing': (context) => LandingPage(),
        './pages/topics/main': (context) => Topics(),
        './pages/topics/transformations/levels/training_station': (context) =>
            TransformIntro(),
        './pages/topics/transformations/levels/beginner_level': (context) =>
            TransFormationsLevels(),
        './pages/topics/transformations/main': (context) =>
            const Transformations(),
      },
    ));
