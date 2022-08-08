import 'package:flutter/material.dart';
import 'package:math_geometry/widgets/actionButton.dart';

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
          const Text("Back"),
          ActionButton(text: "Finish", onPress: () {})
        ],
      ),
    )));
  }
}
