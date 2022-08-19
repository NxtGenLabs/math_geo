import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/themes/textStyles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final Color color;
  final bool attempt;
  const CustomDialog(
      {required this.title,
      required this.color,
      required this.message,
      required this.attempt});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text(
                    title,
                    style: ThemeText.chapter,
                  ),
                  const SizedBox(height: 10),
                  Text(message),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        attempt
                            ? Ink(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 38,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: const Center(child: Text("CLOSE")),
                              )
                            : Ink(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 38,
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Center(child: Text("ATTEMPT")),
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -40,
            child: TweenAnimationBuilder(
              curve: Curves.elasticInOut,
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 1000),
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.amber,
                child: Icon(
                  FontAwesomeIcons.lightbulb,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
