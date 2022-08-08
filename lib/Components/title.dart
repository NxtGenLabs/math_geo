import 'package:flutter/material.dart';
import 'Button/btn-back.dart';

class BackTitle extends StatelessWidget {
  BackTitle({
    Key? key,
    required this.title,
    required this.destination,
  }) : super(key: key);

  final String title;
  var destination;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 242, 242, 242)))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: currentWidth,
            child: Row(
              children: [
                BtnBack(destination: destination),
                Container(
                  width: currentWidth * 0.8,
                  height: size.height * 0.03,
                  alignment: const Alignment(-0.9, 0),
                  child: FittedBox(
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
