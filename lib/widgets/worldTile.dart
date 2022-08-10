import 'package:flutter/cupertino.dart';

class WorldTile extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final void Function() onPress;
  WorldTile(
      {required this.image,
      required this.title,
      required this.color,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 300,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Stack(
          children: [
            Image(image: AssetImage(image)),
            Center(
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: color),
                child: Center(child: Text(title)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
