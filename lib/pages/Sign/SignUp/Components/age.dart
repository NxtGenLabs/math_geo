import 'package:flutter/material.dart';

class Age extends StatelessWidget {
  int year;

  Age({Key? key, required this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            year < 10 ? "0" + year.toString() : year.toString(),
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
