import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  const ActionButton({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, left: 2, right: 2),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 98, 166, 62),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: (MaterialButton(
        height: 50,
        minWidth: MediaQuery.of(context).size.width - 60,
        padding: const EdgeInsets.symmetric(vertical: 15),
        color: const Color.fromRGBO(98, 166, 62, 1),
        onPressed: onPress,
        child: Text(text,
            style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.w600,
                fontSize: 18)),
      )),
    );
  }
}
