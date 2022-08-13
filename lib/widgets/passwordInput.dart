import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordInput extends StatelessWidget {
  final Function(String) onChange;
  final String hintText;

  PasswordInput({required this.hintText, required this.onChange});

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
        obscureText: true,
        cursorColor: Colors.white,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: const Icon(
            FontAwesomeIcons.lock,
            color: Color.fromARGB(255, 113, 191, 71),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsetsDirectional.only(end: 0),
            child: Icon(
              Icons.visibility,
              color: Color.fromARGB(255, 113, 191, 71),
            ),
          ),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    ));
  }
}
