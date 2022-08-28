import 'package:flutter/material.dart';

class AppBarIcon extends StatefulWidget {
  final IconData icon;
  final Function() onTap;
  final Color color;
  const AppBarIcon(this.icon, this.onTap, this.color);

  @override
  State<AppBarIcon> createState() => _AppBarIconState();
}

class _AppBarIconState extends State<AppBarIcon> with TickerProviderStateMixin {
  bool clicked = false;
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curve;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 20, end: 35), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 35, end: 20), weight: 50),
    ]).animate(_controller);

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
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: IconButton(
                iconSize: _sizeAnimation.value,
                onPressed: () {
                  clicked ? _controller.reverse() : _controller.forward();
                  widget.onTap();
                },
                icon: Center(
                  child: Icon(
                    widget.icon,
                    color: Colors.white,
                  ),
                ),
              ));
        });
  }
}
