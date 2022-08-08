import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:splash/pages/Sign/SignUp/Components/scrollWheel.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "What’s your age: ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color.fromARGB(15, 105, 105, 105),
                        ),
                      ),
                    ),
                    ScrollWheel(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
