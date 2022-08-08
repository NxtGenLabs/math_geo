import 'package:flutter/material.dart';

class World extends StatefulWidget {
  World({Key? key, required this.title, required this.destination})
      : super(key: key);

  String title;
  var destination;

  @override
  State<World> createState() => _WorldState();
}

class _WorldState extends State<World> {
  double boxHeight = 500;
  double containerHeight = 0;
  double bdrWidth = 0;
  double rt = 3;
  double lt = 3;
  double tp = 0;
  double bm = 10;

  navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 500), () {});
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget.destination;
    }));
  }

  void trigger() async {
    setState(() {
      boxHeight = 490;
      containerHeight = 10;
      bdrWidth = 1;
      rt = 0;
      lt = 0;
      tp = 0;
      bm = 0;
    });
    await Future.delayed(const Duration(milliseconds: 100), () {});
    setState(() {
      boxHeight = 500;
      containerHeight = 0;
      rt = 3;
      lt = 3;
      tp = 0;
      bm = 10;
    });
    navigatetohome();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 550,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: containerHeight,
              width: double.infinity,
            ),
            GestureDetector(
              onTap: trigger,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                padding: EdgeInsets.fromLTRB(lt, tp, rt, bm),
                height: boxHeight,
                width: currentWidth * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 150, 75, 79),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 75, 79),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 480,
                    child: Image.asset(
                      "assets/images/cornfield.jpg",
                      height: size.height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
