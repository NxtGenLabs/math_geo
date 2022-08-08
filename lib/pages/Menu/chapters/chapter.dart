import 'package:flutter/material.dart';

class Chapter extends StatefulWidget {
  Chapter({
    Key? key,
    required this.title,
    required this.destination,
  }) : super(key: key);

  String title;
  var destination;

  @override
  State<Chapter> createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  double boxHeight = 110;
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
      boxHeight = 100;
      containerHeight = 10;
      bdrWidth = 1;
      rt = 0;
      lt = 0;
      tp = 0;
      bm = 0;
    });
    await Future.delayed(const Duration(milliseconds: 100), () {});
    setState(() {
      boxHeight = 110;
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
      child: Container(
        margin: EdgeInsets.all(16),
        height: 130,
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
                  ),
                  child: Container(
                    height: 90,
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/Nxt.png",
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                          Container(
                            width: currentWidth * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: const [
                                Text(
                                  "9. Transformations",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "03 Concepts",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
