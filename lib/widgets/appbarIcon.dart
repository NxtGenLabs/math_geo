import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final String image;
  final Function() onTap;
  const AppBarIcon(this.image, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Material(
        color: const Color.fromARGB(255, 242, 242, 242),
        elevation: 10,
        child: InkWell(
          onTap: onTap,
          child: Container(
              margin: const EdgeInsets.all(5),
              width: 25,
              height: 25,
              child: Image(
                  filterQuality: FilterQuality.high,
                  image: AssetImage("images/icons/$image"))),
        ),
      ),
    );
  }
}
