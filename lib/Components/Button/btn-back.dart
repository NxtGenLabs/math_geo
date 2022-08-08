import 'package:flutter/material.dart';

class BtnBack extends StatefulWidget {
  var destination;
  BtnBack({Key? key, required this.destination}) : super(key: key);

  @override
  State<BtnBack> createState() => _BtnBackState();
}

class _BtnBackState extends State<BtnBack> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return widget.destination;
            },
          ),
        );
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
