import 'package:flutter/material.dart';

class ChapterTile extends StatelessWidget {
  final String chapter;
  final void Function() onPress;

  ChapterTile({required this.chapter, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromARGB(255, 230, 230, 230)),
        padding: const EdgeInsets.only(bottom: 8, left: 2, right: 2),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 80,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color.fromARGB(255, 252, 252, 252)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color.fromARGB(255, 217, 217, 217)),
                      child: const Image(image: AssetImage("images/lock.png"))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(chapter),
                  ),
                ],
              ),
              const Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}
