import 'package:flutter/material.dart';

class TextInputValidated extends StatelessWidget {
  final Function(String) onChange;
  final String? Function(String?) validator;
  final String hintText;
  final IconData icon;

  TextInputValidated(
      {required this.hintText,
      required this.validator,
      required this.onChange,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(105, 105, 105, 0.25)),
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        validator: validator,
        onChanged: onChange,
        cursorColor: Colors.white,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 113, 191, 71),
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
