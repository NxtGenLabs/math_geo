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
        body: SafeArea(
      child: Container(
        child: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('images/submit_bg.jpg'))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  ],
                ),
                const Text("Let us begin..."),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ActionButton(
                      text: "Finish",
                      onPress: () {
                        Navigator.pushNamed(context, './pages/landing');
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
