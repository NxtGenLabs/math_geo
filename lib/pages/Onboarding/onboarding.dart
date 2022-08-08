import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splash/Components/Button/btn-back.dart';
import 'package:splash/Components/Button/btn-green.dart';
import 'package:splash/pages/StartUp/startMenu.dart';
import '../Sign/SignUp/signUp.dart';
import 'IntroPg-1.dart';
import 'IntroPg-2.dart';
import 'IntroPg-3.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // Controller
  PageController controller = PageController();

  bool onFirstPage = false;
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        // Page View
        PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              onFirstPage = (index == 0);
              onLastPage = (index == 2);
            });
          },
          children: const [
            IntroPg1(),
            IntroPg2(),
            IntroPg3(),
          ],
        ),

        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(8, 80, 8, 8),
                  alignment: Alignment(-0.95, 0.8),
                  child: onFirstPage
                      ? BtnBack(destination: StartMenu())
                      : IconButton(
                          onPressed: () async {
                            controller.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip
                  GestureDetector(
                    onTap: () {
                      controller.jumpToPage(2);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 69, 69, 69),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.02),

                  // Dot indicator
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 3,
                      spacing: 4.0,
                      radius: 5.0,
                      dotWidth: 10.0,
                      dotHeight: 8.0,
                      strokeWidth: 9.5,
                      dotColor: Colors.black,
                      activeDotColor: Colors.black,
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.04,
                  ),

                  // Next & Continue Button
                  onLastPage
                      ? BtnGreen(
                          title: "FINISH",
                          destination: SignUp(),
                          isDestination: false,
                          fallback: true,
                        )
                      : BtnGreen(
                          title: "CONTINUE",
                          isDestination: true,
                          controller: controller,
                          fallback: true,
                        ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
