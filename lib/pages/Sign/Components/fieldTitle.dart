import 'package:flutter/material.dart';

class fieldTitle extends StatefulWidget {
  final String title;
  const fieldTitle({Key? key, required this.title}) : super(key: key);

  @override
  State<fieldTitle> createState() => _fieldTitleState();
}

class _fieldTitleState extends State<fieldTitle> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      width: currentWidth * 0.9,
      child: Text(
        widget.title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}