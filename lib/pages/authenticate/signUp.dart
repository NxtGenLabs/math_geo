import 'package:flutter/material.dart';
import 'package:math_geometry/services/auth.dart';

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
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Back"))
                ],
              ),
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
                          const Text("Enter your First Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(
                                        105, 105, 105, 0.25)),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              validator: (val) => val!.isEmpty
                                  ? 'Please enter your fullname'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  fullname = val;
                                });
                              },
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Full Name',
                                  hintStyle:
                                      TextStyle(color: Colors.grey[300])),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text("Enter your Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(
                                        105, 105, 105, 0.25)),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              validator: (val) => val!.isEmpty
                                  ? 'Password must have atleast 6 characters'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle:
                                      TextStyle(color: Colors.grey[300])),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text("Confirm password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(
                                        105, 105, 105, 0.25)),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              validator: (val) => val!.isEmpty
                                  ? 'Password empty or does not match'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  confirmPass = val;
                                });
                              },
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Confirm password',
                                  hintStyle:
                                      TextStyle(color: Colors.grey[300])),
                            ),
                          ),
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
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width - 60,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: const Color.fromRGBO(98, 166, 62, 1),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        dynamic result = await _auth.storeUsernameAndPassword(
                            fullname, password);
                        Navigator.pushNamed(
                            context, './pages/authenticate/genderXage');
                      }
                    },
                    child: const Text("CONTINUE",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
