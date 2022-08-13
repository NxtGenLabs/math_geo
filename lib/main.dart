import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:math_geometry/pages/authenticate/genderXage.dart';
import 'package:math_geometry/pages/authenticate/submitPage.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/main.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/level/beginner.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/level/intermediate.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/level/trainingStation/training_station.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/menus/beginner_level.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/menus/intermediate_level.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/menus/training_station_level.dart';
import 'package:math_geometry/pages/classes/Form%203/subjects/Mathematics/topics/transformations/transformations.dart';
import 'package:math_geometry/pages/classes/classes.dart';
import 'package:math_geometry/pages/landing.dart';
import 'package:math_geometry/pages/profile/profile.dart';
import 'package:math_geometry/pages/profile/settings.dart';
import 'package:math_geometry/pages/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: const Wrapper(),
    routes: {
      './pages/profile/settings': (context) => Settings(),
      './pages/profile/profile': (context) => const Profile(),
      './pages/classes/transformations': (context) => Transformations(),
      './pages/classes/classes': (context) => const Classes(),
      './pages/landing': (context) => LandingPage(),
      './pages/authenticate/genderXage': (context) => const GenderXAge(),
      './pages/authenticate/submitPage': (context) => const SubmitPage(),
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
