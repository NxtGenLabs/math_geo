import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';
import 'package:splash/Components/Button/btn-back.dart';
import 'package:splash/pages/Menu/homeMenu.dart';

class MenuBackground extends StatefulWidget {
  const MenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<MenuBackground> createState() => _MenuBackgroundState();
}

class _MenuBackgroundState extends State<MenuBackground> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.4,
                  width: size.width,
                  child: Image.asset(
                    "assets/images/math-set.jpg",
                    height: size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: size.height * 0.6,
                  width: size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.3, 0.7],
                      colors: [
                        Color.fromARGB(255, 123, 26, 20),
                        Color.fromARGB(255, 252, 255, 252)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.95,
                  height: size.height * 0.15,
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.025, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: BtnBack(destination: HomeMenu()),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ButtonDirectory(
                              title: "Mathematics",
                              color: Color.fromARGB(255, 167, 45, 44),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                PageTitle(
                  title: "Mathematics",
                  color: Color.fromARGB(47, 123, 26, 20),
                ),
                Container(
                  height: size.height * 0.7,
                  width: size.width * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Color.fromARGB(255, 252, 255, 250),
                  ),
                  child: widget.child,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ButtonDirectory extends StatelessWidget {
  ButtonDirectory({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  var color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 12.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  PageTitle({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  var color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 3,
          colors: [
            color,
            Colors.transparent,
          ],
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
