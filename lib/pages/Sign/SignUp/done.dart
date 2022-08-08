import 'package:flutter/material.dart';

class Done extends StatefulWidget {
  const Done({Key? key}) : super(key: key);

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Image.asset(
            height: size.height,
            width: size.width,
            "assets/images/wooden-terrace-woman-with-pets-savannah.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment(-0.5, -0.7),
            child: const Text(
              "Let us begin...",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
