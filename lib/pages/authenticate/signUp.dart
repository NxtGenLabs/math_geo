import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp(this.toggleView);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

  String fullname = '';
  String grade = '';
  String password = '';
  String school = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.teal,
      child: SafeArea(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Create an accoun to play"),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your fullname' : null,
                    onChanged: (val) {
                      setState(() {
                        fullname = val;
                      });
                    },
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'FullName',
                        hintStyle: TextStyle(color: Colors.grey[300])),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'School cannot be empty' : null,
                    onChanged: (val) {
                      setState(() {
                        school = val;
                      });
                    },
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'School',
                        hintStyle: TextStyle(color: Colors.grey[300])),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'Class cannot be empty' : null,
                    onChanged: (val) {
                      setState(() {
                        grade = val;
                      });
                    },
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Class',
                        hintStyle: TextStyle(color: Colors.grey[300])),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (val) => val!.length < 6
                        ? 'Password must have atleast 6 characters'
                        : null,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: true,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey[300])),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  color: Colors.grey[300],
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      print(fullname);
                      print(school);
                      print(grade);
                      print(password);
                    }
                  },
                  child: const Text("Signup"),
                ),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                      onTap: () => widget.toggleView(), child: Text("SignIn"))
                ])
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
