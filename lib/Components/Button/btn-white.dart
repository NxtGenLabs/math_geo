import 'package:flutter/material.dart';

class BtnWhite extends StatefulWidget {
  BtnWhite({Key? key, required this.title, required this.destination})
      : super(key: key);

  String title;
  var destination;

  @override
  State<BtnWhite> createState() => _BtnWhiteState();
}

class _BtnWhiteState extends State<BtnWhite> {
  double boxHeight = 60;
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
      boxHeight = 50;
      containerHeight = 10;
      bdrWidth = 1;
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
    navigatetohome();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Center(
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
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromARGB(63, 230, 230, 230),
                    width: bdrWidth,
                  )),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 252, 246),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromARGB(255, 248, 252, 246),
                    width: bdrWidth,
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
                          color: Color.fromARGB(255, 60, 64, 58),
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
    );
  }
}
