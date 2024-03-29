import 'package:flutter/material.dart';
import 'package:math_geometry/themes/textStyles.dart';

class Pick extends StatefulWidget {
  final String pick;
  final Function() onTap;
  const Pick(this.pick, this.onTap);

  @override
  State<Pick> createState() => _PickState();
}

class _PickState extends State<Pick> with TickerProviderStateMixin {
  bool clicked = false;
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curve;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 40, end: 60), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 60, end: 40), weight: 50),
    ]).animate(_curve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          clicked = true;
        });
      }

      if (status == AnimationStatus.dismissed) {
        setState(() {
          clicked = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            height: _sizeAnimation.value,
            width: _sizeAnimation.value,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: TextButton(
                onPressed: () {
                  clicked ? _controller.reverse() : _controller.forward();
                  widget.onTap();
                },
                child: Text(
                  widget.pick,
                  style: ThemeText.multipleChoice,
                )),
          );
        });
  }
}
