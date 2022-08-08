import 'package:flutter/material.dart';
import 'package:splash/pages/Sign/Components/fieldTitle.dart';

import '../../../Components/Background/background.dart';
import '../Components/inputField.dart';
import '../Components/passwordField.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 16,
        ),
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Please enter your information",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.04
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const fieldTitle(title: "Enter in your Username"),
            RoundInputField(
              hintText: "Username",
              onChanged: (value) {},
            ),
            const fieldTitle(title: "Enter in your Password"),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            const fieldTitle(title: "Confirm your Password"),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.1
        ),
      ],
    );
  }
}
