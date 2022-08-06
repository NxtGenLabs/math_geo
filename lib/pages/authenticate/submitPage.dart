import 'package:flutter/material.dart';

import '../../services/auth.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({Key? key}) : super(key: key);

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Back"),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width - 60,
            padding: const EdgeInsets.symmetric(vertical: 15),
            color: const Color.fromRGBO(98, 166, 62, 1),
            onPressed: () {
              //function to submit registration details from temp to firebase
            },
            child: const Text("Finish",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 18)),
          ),
        ],
      ),
    )));
  }
}
