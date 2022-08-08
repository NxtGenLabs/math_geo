import 'package:flutter/material.dart';
import 'package:splash/pages/Menu/chapters/chapterSelect.dart';
import 'package:splash/pages/Settings/setting.dart';
import 'package:splash/pages/Users/Users.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Stack(
            children: [
              Container(
                child: Image.asset(
                  height: size.height,
                  width: size.width,
                  "assets/images/Savannah.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: size.height * 0.95,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Let's start",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 32,
                            color: Color.fromARGB(255, 60, 64, 58),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              width: size.width * 0.95,
              alignment: Alignment(0, -0.95),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment(-1.6, -0.4),
                        width: 100,
                        height: 100,
                        child: IconButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Users();
                                },
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.supervised_user_circle,
                            size: 60,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment(0.4, -0.4),
                        width: 100,
                        height: 100,
                        child: IconButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ChapterSelect();
                                },
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.settings,
                            size: 60,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Welcome Back, " + "Bright" + "!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 60, 64, 58),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
