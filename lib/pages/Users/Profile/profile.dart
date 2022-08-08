import 'package:flutter/material.dart';
import 'package:splash/Components/title.dart';
import 'package:splash/pages/Menu/homeMenu.dart';
import 'package:splash/pages/Users/Profile/achievements.dart';
import 'package:splash/pages/Users/Profile/details.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 0;
  bool isInfo = true;

  changeToInfo() {
    setState(() {
      isInfo = true;
    });
  }

  changeToAchieve() {
    setState(() {
      isInfo = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackTitle(title: "Profile", destination: HomeMenu()),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      height: size.height * 0.2,
                      width: size.height * 0.2,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      width: size.width * 0.8,
                      child: const Text(
                        "Bright Nthara",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      width: size.width * 0.8,
                      child: const Text(
                        "130000 points",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.8,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 246, 229),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: changeToInfo,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        width: size.width * 0.4,
                        height: size.height * 0.05,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Color.fromARGB(63, 94, 94, 94),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Information",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              color: isInfo
                                  ? Color.fromARGB(255, 121, 185, 186)
                                  : Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: changeToAchieve,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        width: size.width * 0.4,
                        height: size.height * 0.05,
                        decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Color.fromARGB(63, 94, 94, 94)))),
                        child: Center(
                          child: Text(
                            "Achievements",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              color: isInfo
                                  ? Color.fromARGB(255, 0, 0, 0)
                                  : Color.fromARGB(255, 121, 185, 186),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 36),
                height: size.height * 0.4,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 235, 246, 229),
                ),
                child: isInfo ? const details() : const Achievements(),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
