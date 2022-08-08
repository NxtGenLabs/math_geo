import 'package:flutter/material.dart';
import 'package:splash/Components/Button/btn-back.dart';
import 'package:splash/Components/Button/btn-green.dart';
import 'package:splash/pages/Menu/homeMenu.dart';
import 'package:splash/pages/Onboarding/onboarding.dart';
import 'package:splash/pages/Settings/Setting.dart';
import '../../../Components/Background/background.dart';
import '../../StartUp/startMenu.dart';
import '../Components/accountCheck.dart';
import '../Components/fieldTitle.dart';
import '../Components/inputField.dart';
import '../Components/passwordField.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment(-0.95, -1),
                child: BtnBack(destination: StartMenu()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Hello, Welcome back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Image.asset(
                  "assets/images/NxtGen Labs Logo black.png",
                  width: size.width * 0.8,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const fieldTitle(title: "Enter in your Username"),
              RoundInputField(
                hintText: "Username",
                onChanged: (value) {},
              ),
              const fieldTitle(title: "Enter in your Password"),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BtnGreen(
                title: "Sign in",
                destination: HomeMenu(),
                isDestination: false,
                fallback: true,
              ),
              AccountCheck(
                login: true,
                color: Color.fromARGB(255, 113, 191, 71),
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Onboarding();
                  }));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
