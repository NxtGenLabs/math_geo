import 'package:flutter/material.dart';

import '../themes/textStyles.dart';

class ActiveChapterTile extends StatelessWidget{
final String chapter;
  final void Function() onPress;

  const ActiveChapterTile({required this.chapter, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
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
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage("images/active_chapter.png"))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(chapter, style: ThemeText.chapter),
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