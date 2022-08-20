import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final Color color;
  const AppBarIcon(this.icon, this.onTap, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: IconButton(
          iconSize: 20,
          onPressed: onTap,
          icon: Center(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ));
  }
}
