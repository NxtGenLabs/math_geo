import 'package:flutter/material.dart';

class ChooseCharacter extends StatelessWidget {
  const ChooseCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(color: Colors.teal),
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width - 60,
                padding: const EdgeInsets.symmetric(vertical: 15),
                color: const Color.fromRGBO(98, 166, 62, 1),
                onPressed: () {
                  Navigator.pushNamed(
                      context, './pages/authenticate/submitPage');
                },
                child: const Text("CONTINUE",
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
