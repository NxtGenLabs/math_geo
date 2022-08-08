import 'package:flutter/material.dart';

class Level extends StatefulWidget {
  Level({Key? key, required this.title, required this.destination})
      : super(key: key);

  String title;
  var destination;

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  double boxHeight = 165;
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
      boxHeight = 155;
      containerHeight = 10;
      bdrWidth = 1;
      rt = 0;
      lt = 0;
      tp = 0;
      bm = 0;
    });
    await Future.delayed(const Duration(milliseconds: 100), () {});
    setState(() {
      boxHeight = 165;
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
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 150,
      margin: EdgeInsets.all(16),
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
              width: 135,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 98, 166, 62),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromARGB(255, 98, 166, 62),
                    width: bdrWidth,
                  )),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 113, 191, 71),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromARGB(255, 113, 191, 71),
                    width: bdrWidth,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 145,
                  child: Center(
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 48,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w700,
                          ),
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
