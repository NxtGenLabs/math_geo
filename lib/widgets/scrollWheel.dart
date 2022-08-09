import 'package:flutter/material.dart';

class ScrollWheel extends StatefulWidget {
  const ScrollWheel({Key? key}) : super(key: key);

  @override
  State<ScrollWheel> createState() => _ScrollWheelState();
}

class _ScrollWheelState extends State<ScrollWheel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.1,
      child: ListWheelScrollView.useDelegate(
        onSelectedItemChanged: (value) {},
        itemExtent: 50,
        perspective: 0.005,
        diameterRatio: 1.2,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 30,
          builder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                child: Center(
                  child: Text(
                    index < 10 ? "0$index" : index.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
