import 'package:flutter/material.dart';
import 'package:math_geometry/pages/landing.dart';
import 'package:math_geometry/pages/topics/transformations/levels.dart';
import 'package:math_geometry/pages/topics/transformations/transformation_intro.dart';
import 'pages/topics/main.dart';
import 'pages/topics/transformations/main.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: LandingPage(),
      routes: {
        './pages/landing': (context) => LandingPage(),
        './pages/topics/main': (context) => Topics(),
        './pages/topics/transformations/levels': (context) => TransFormationsLevels(),
        './pages/topics/transformations/transformation_intro': (context) => TransformIntro(),
        './pages/topics/transformations/main': (context) => Transformations(),
      },
    ));
