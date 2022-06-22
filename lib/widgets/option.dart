import 'package:flutter/material.dart';

class Option extends StatelessWidget {

  final String text;
  final void Function() route;
  Option({required this.text,required this.route});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.grey[300],
                side: BorderSide(color: Color.fromARGB(224, 224, 224, 225)),
                padding: EdgeInsets.all(40)),
              onPressed: route,
              child: Text(text));
  }
}