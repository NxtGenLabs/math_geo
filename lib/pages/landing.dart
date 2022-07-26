import 'package:flutter/material.dart';
import 'package:math_geometry/services/auth.dart';
import 'package:math_geometry/widgets/option.dart';

class LandingPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Option(
              text: 'PLAY',
              route: () => Navigator.pushNamed(context, './pages/topics/main')),
          const SizedBox(width: 20),
          Option(
              text: "SignOut",
              route: () async {
                dynamic result = await _auth.signOut();
                if (result == null) {
                  print("Some error");
                }
              })
        ],
      )),
    );
  }
}
