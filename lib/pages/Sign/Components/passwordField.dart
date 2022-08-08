import 'package:flutter/material.dart';

import 'textFieldContainer.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Color.fromARGB(255, 113, 191, 71),
          ),
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 0),
            child: Icon(
              Icons.visibility,
              color: Color.fromARGB(255, 113, 191, 71),
            ),
          ),
          border: InputBorder.none,
          hintText: "Password",
        ),
      ),
    );
  }
}
