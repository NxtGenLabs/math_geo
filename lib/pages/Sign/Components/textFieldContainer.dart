import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(
        0,
        size.height * 0.01,
        0,
        size.height * 0.04,
      ),
      padding: const EdgeInsets.fromLTRB(
        10,
        5,
        10,
        5,
      ),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color.fromARGB(15, 105, 105, 105),
        ),
      ),
      child: child,
    );
  }
}
