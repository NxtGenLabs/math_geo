import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_geometry/services/auth.dart';
import 'package:math_geometry/themes/background.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/actionButton.dart';
import 'package:math_geometry/widgets/passwordInput.dart';
import 'package:math_geometry/widgets/textInput.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn(this.toggleView);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String fullname = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Background(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.chevronLeft)),
                      ],
                    ),
                  ),
                  const Text(
                    "Hello, Welcome back.",
                    style: ThemeText.chapter,
                  ),
                  const SizedBox(height: 80),
                  const Image(
                    image: AssetImage('images/nxtlogo.png'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter your username",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 20),
                    TextInput(
                        icon: Icons.person,
                        hintText: "Username",
                        onChange: (val) {
                          setState(() {
                            fullname = val;
                          });
                        }),
                    const SizedBox(height: 20),
                    const Text("Enter your password",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 20),
                    PasswordInput(
                        hintText: "Password",
                        onChange: (val) {
                          setState(() {
                            password = val;
                          });
                        })
                  ],
                ),
              ),
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text("Don't have an account?",
                        style: TextStyle(fontSize: 16)),
                    TextButton(
                        onPressed: () => widget.toggleView(),
                        child: const Text("Sign Up",
                            style: TextStyle(
                                color: Color.fromRGBO(98, 166, 62, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 16)))
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ActionButton(
                        text: "SIGN IN",
                        onPress: () async {
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(fullname, password);
                          if (result == null) {
                            setState(() {
                              error = 'Could not sign in';
                            });
                          }
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
