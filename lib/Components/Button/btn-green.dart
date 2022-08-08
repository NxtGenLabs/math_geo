import 'package:flutter/material.dart';

class BtnGreen extends StatefulWidget {
  BtnGreen(
      {Key? key,
      required this.title,
      this.destination,
      required this.isDestination,
      required this.fallback,
      this.controller})
      : super(key: key);

  String title;
  var destination;
  bool isDestination;
  bool fallback = true;
  var controller;

  @override
  State<BtnGreen> createState() => _BtnGreenState();
}

class _BtnGreenState extends State<BtnGreen> {
  double boxHeight = 60;
  double containerHeight = 0;
  double rt = 3;
  double lt = 3;
  double tp = 0;
  double bm = 10;

  gotonextpage() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget.destination;
    }));
  }

  gotonextscreen() async {
    widget.controller
        .nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  goandnoreturn() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget.destination));
  }

  void trigger() async {
    setState(() {
      boxHeight = 50;
      containerHeight = 10;
      rt = 0;
      lt = 0;
      tp = 0;
      bm = 0;
    });
    await Future.delayed(const Duration(milliseconds: 100), () {});
    setState(() {
      boxHeight = 60;
      containerHeight = 0;
      rt = 3;
      lt = 3;
      tp = 0;
      bm = 10;
    });
    widget.isDestination
        ? gotonextscreen()
        : (widget.fallback ? gotonextpage() : goandnoreturn());
  }

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
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
                curve: Curves.easeIn,
                padding: EdgeInsets.fromLTRB(lt, tp, rt, bm),
                height: boxHeight,
                width: currentWidth * 0.9,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 98, 166, 62),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromARGB(255, 98, 166, 62),
                    )),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 113, 191, 71),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromARGB(255, 113, 191, 71),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
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
