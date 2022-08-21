import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String clsBtnTitle;
  final bool attempt;
  final secBtnTitle;
  final secOnPress;
  final IconData header;
  final Color headerColor;
  final Function() onClsBtnPressed;
  const CustomDialog(
      {required this.title,
      required this.clsBtnTitle,
      required this.message,
      required this.attempt,
      this.secBtnTitle,
      this.secOnPress,
      required this.header,
      required this.headerColor,
      required this.onClsBtnPressed});

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
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: ThemeText.title,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    message,
                    style: ThemeText.normal,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      attempt
                          ? TextButton(
                              onPressed: secOnPress,
                              child: Text(
                                secBtnTitle,
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                            )
                          : (Container()),
                      TextButton(
                        onPressed: onClsBtnPressed,
                        child: Text(
                          clsBtnTitle,
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                      )
                    ],
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
              child: CircleAvatar(
                radius: 40,
                backgroundColor: headerColor,
                child: Icon(
                  header,
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
