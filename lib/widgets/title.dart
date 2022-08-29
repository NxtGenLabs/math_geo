import 'package:flutter/material.dart';

import '../themes/textStyles.dart';

class AnimatedTitle extends StatefulWidget {
  final String title;

  const AnimatedTitle({required this.title});

  @override
  State<AnimatedTitle> createState() => _AnimatedTitleState();
}

class _AnimatedTitleState extends State<AnimatedTitle> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      builder: (BuildContext context, double val, child) {
        return Opacity(
          opacity: val,
          child: Padding(
            padding: EdgeInsets.only(top: val * 40),
            child: child,
          ),
        );
      },
      child: Text(widget.title, style: ThemeText.levelHeader),
    );
  }
}
