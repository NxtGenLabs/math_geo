import 'package:flutter/material.dart';
import 'package:math_geometry/pages/authenticate/signIn.dart';
import 'package:math_geometry/pages/authenticate/signUp.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(toggleView);
    } else{
      return SignUp(toggleView);
    }
  }
}