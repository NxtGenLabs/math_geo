import 'package:flutter/material.dart';
import 'package:math_geometry/services/auth.dart';
import 'package:math_geometry/widgets/actionButton.dart';
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
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(227, 242, 218, .15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back)),
                    ],
                  ),
                  const Text(
                    "Hello, Welcome back.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
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
                    TextInput(
                        icon: Icons.lock,
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
                  ActionButton(
                      text: "SIGN IN",
                      onPress: () async {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            fullname, password);
                        if (result == null) {
                          setState(() {
                            error = 'Could not sign in';
                          });
                        }
                      })
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
