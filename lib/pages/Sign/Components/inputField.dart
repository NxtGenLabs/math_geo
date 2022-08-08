import 'package:flutter/material.dart';

import 'textFieldContainer.dart';

class RoundInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 113, 191, 71),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}