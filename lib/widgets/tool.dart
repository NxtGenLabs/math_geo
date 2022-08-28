import 'package:flutter/material.dart';

class Tool extends StatefulWidget {
  final IconData icon;
  final Function() onTap;

  const Tool(this.icon, this.onTap);

  @override
  State<Tool> createState() => _ToolState();
}

class _ToolState extends State<Tool> with TickerProviderStateMixin {
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
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 40), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 40, end: 25), weight: 50),
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
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Color.fromARGB(255, 217, 217, 217)),
            child: IconButton(
              color: const Color.fromARGB(255, 45, 46, 47),
              onPressed: () {
                clicked ? _controller.reverse() : _controller.forward();
                widget.onTap();
              },
              icon: Icon(
                widget.icon,
                size: _sizeAnimation.value,
              ),
            ),
          );
        });
  }
}
