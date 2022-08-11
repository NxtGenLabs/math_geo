import 'package:flutter/cupertino.dart';
import 'package:math_geometry/themes/textStyles.dart';

class WorldTile extends StatelessWidget {
  final String image;
  final String title;
  final String route;
  final Color color;
  const WorldTile(
      {required this.image,
      required this.title,
      required this.color,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 300,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Stack(
          children: [
            SizedBox(
                height: 350,
                width: MediaQuery.of(context).size.width - 50,
                child: Image(fit: BoxFit.cover, image: AssetImage(image))),
            Center(
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: color),
                child: Center(child: Text(title, style: ThemeText.world)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
