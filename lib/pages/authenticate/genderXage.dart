import 'package:flutter/material.dart';

class GenderXAge extends StatelessWidget {
  const GenderXAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(227, 242, 218, .15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Select your gender'),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(color: Colors.teal),
              ),
              const Text('Whats your age ?'),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width - 60,
                padding: const EdgeInsets.symmetric(vertical: 15),
                color: const Color.fromRGBO(98, 166, 62, 1),
                onPressed: () {
                  Navigator.pushNamed(
                      context, './pages/authenticate/chooseCharacter');
                },
                child: const Text("CONTINUE",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
