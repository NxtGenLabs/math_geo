import 'package:flutter/material.dart';
import 'package:math_geometry/services/auth.dart';
import 'package:math_geometry/widgets/actionButton.dart';
import 'package:math_geometry/widgets/textInputValidated.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp(this.toggleView);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String fullname = '';
  String password = '';
  String confirmPass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(227, 242, 218, .15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              const Text("Please enter your information"),
              Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text("Enter your Username",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          const SizedBox(height: 20),
                          TextInputValidated(
                              icon: Icons.person,
                              hintText: "Username",
                              onChange: (val) {
                                setState(() {
                                  fullname = val;
                                });
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Please enter your fullname'
                                  : null),
                          const SizedBox(height: 20),
                          const Text("Enter your Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          const SizedBox(height: 20),
                          TextInputValidated(
                              hintText: "Password",
                              validator: (val) => val!.isEmpty
                                  ? 'Password must have atleast 6 characters'
                                  : null,
                              onChange: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
                              icon: Icons.lock),
                          const SizedBox(height: 20),
                          const Text("Confirm password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          const SizedBox(height: 20),
                          TextInputValidated(
                              hintText: "Password",
                              validator: (val) => val!.isEmpty
                                  ? 'Password empty or does not match'
                                  : null,
                              onChange: (val) {
                                setState(() {
                                  confirmPass = val;
                                });
                              },
                              icon: Icons.lock)
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text("Already have an account?",
                        style: TextStyle(fontSize: 16)),
                    TextButton(
                        onPressed: () => widget.toggleView(),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Color.fromRGBO(98, 166, 62, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ))
                  ]),
                  ActionButton(
                      text: "Continue",
                      onPress: () async {
                        if (_formkey.currentState!.validate()) {
                          dynamic result = await _auth.storeUsernameAndPassword(
                              fullname, password);
                          Navigator.pushNamed(
                              context, './pages/authenticate/genderXage');
                        }
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
