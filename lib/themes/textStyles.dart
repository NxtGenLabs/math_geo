import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle header2 = TextStyle(
      fontFamily: 'Popins',
      color: Color.fromARGB(255, 60, 64, 58),
      fontSize: 24,
      fontWeight: FontWeight.w600);
  static const TextStyle normal = TextStyle(
      fontFamily: 'Popins',
      color: Color.fromARGB(255, 60, 64, 58),
      fontSize: 14,
      fontWeight: FontWeight.normal);
  static const TextStyle chapter = TextStyle(
      fontFamily: 'Popins',
      color: Color.fromARGB(255, 60, 64, 58),
      fontSize: 16,
      fontWeight: FontWeight.w600);
  static const TextStyle world = TextStyle(
      fontFamily: 'Popins',
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600);
  static const TextStyle level = TextStyle(
      fontFamily: 'Popins',
      color: Colors.white,
      fontSize: 45,
      fontWeight: FontWeight.w800);
  static const TextStyle levelHeader = TextStyle(
      fontFamily: 'Popins',
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w800);
}
