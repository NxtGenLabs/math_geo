import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final Function(String) onChange;
  final String hintText;
  final IconData icon;

  TextInput(
      {required this.hintText, required this.onChange, required this.icon});

  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(color: const Color.fromRGBO(105, 105, 105, 0.25)),
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        onChanged: onChange,
        cursorColor: Colors.white,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 113, 191, 71),
          ),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    ));
  }
}
