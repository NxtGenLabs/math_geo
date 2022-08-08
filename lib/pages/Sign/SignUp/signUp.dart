import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:splash/Components/Background/background.dart';
import 'package:splash/Components/Button/btn-back.dart';
import 'package:splash/Components/Button/btn-green.dart';
import 'package:splash/pages/Menu/homeMenu.dart';
import 'package:splash/pages/Onboarding/onboarding.dart';
import 'package:splash/pages/Sign/SignIn/SignIn.dart';
import 'package:splash/pages/Sign/SignUp/character.dart';
import 'package:splash/pages/Sign/SignUp/done.dart';
import 'package:splash/pages/Sign/SignUp/moreDetails.dart';
import '../Components/accountCheck.dart';
import 'authenticationDetails.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  PageController controller = PageController();
  bool onFirstPage = false;
  bool onLastPage = false;
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
      child: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                pageNumber = index;
                onFirstPage = (index == 0);
                onLastPage = (index == 3);
              });
            },
            children: const [
              Authenticate(),
              MoreDetails(),
              Character(),
              Done(),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          margin: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 2),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        LinearPercentIndicator(
                          animation: true,
                          animationDuration: 500,
                          width: currentWidth / 2,
                          lineHeight: 8,
                          percent: pageNumber / 3,
                          progressColor: const Color.fromARGB(255, 0, 0, 0),
                          backgroundColor: Color.fromARGB(255, 187, 187, 187),
                          barRadius: const Radius.circular(20),
                          animateFromLastPercent: true,
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: 24,
                          width: 24,
                          margin: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 2),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check_rounded,
                              color: onLastPage
                                  ? Color.fromARGB(255, 98, 166, 62)
                                  : Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        alignment: Alignment(-0.95, -1),
                        child: onFirstPage
                            ? BtnBack(destination: Onboarding())
                            : IconButton(
                                onPressed: () async {
                                  controller.previousPage(
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.easeIn);
                                },
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded),
                              )),
                  ],
                ),

                // Next & Continue Button
                Column(
                  children: [
                    Container(
                      child: onLastPage
                          ? BtnGreen(
                              title: "FINISH",
                              destination: HomeMenu(),
                              isDestination: false,
                              fallback: false,
                            )
                          : BtnGreen(
                              title: "CONTINUE",
                              isDestination: true,
                              controller: controller,
                              fallback: true,
                            ),
                    ),
                    AccountCheck(
                      login: false,
                      color: Colors.black,
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
