import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  ActionButton({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return (MaterialButton(
      minWidth: MediaQuery.of(context).size.width - 60,
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: const Color.fromRGBO(98, 166, 62, 1),
      onPressed: onPress,
      child: Text(text,
          style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w600,
              fontSize: 18)),
    ));
  }
}
