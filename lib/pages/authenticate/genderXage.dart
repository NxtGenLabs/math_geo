import 'package:flutter/material.dart';

class GenderXAge extends StatelessWidget {
  const GenderXAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(227, 242, 218, .15),
        ),
      ),
    ));
  }
}
