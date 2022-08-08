import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/actionButton.dart';

class ChooseCharacter extends StatelessWidget {
  const ChooseCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(color: Colors.teal),
              ),
              ActionButton(
                  text: "Continue",
                  onPress: () {
                    Navigator.pushNamed(
                        context, './pages/authenticate/submitPage');
                  })
            ],
          ),
        )));
  }
}
