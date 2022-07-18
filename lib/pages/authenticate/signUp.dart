import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      color: Colors.teal,
      child: SafeArea(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Create an accoun to play"),
              const SizedBox(height:20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: InputBorder.none,hintText: 'FullName',hintStyle: TextStyle(color: Colors.grey[300])),
                ),
              ),
              const SizedBox(height:20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: InputBorder.none,hintText: 'School',hintStyle: TextStyle(color: Colors.grey[300])),
                ),
              ),
              const SizedBox(height:20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: InputBorder.none,hintText: 'Class',hintStyle: TextStyle(color: Colors.grey[300])),
                ),
              ),
              const SizedBox(height:20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  obscureText: true,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: InputBorder.none,hintText: 'Password',hintStyle: TextStyle(color: Colors.grey[300])),
                ),
              ),
              const SizedBox(height:20),
              MaterialButton(color: Colors.grey[300] ,onPressed: (){},child: const Text("Signup"),),
              const SizedBox(height:20),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                const Text("Already have an account?"),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, './pages/authenticate/signIn'),
                    child: Text("SignIn")
                )
              ])
              

            ],
          ),
        ),
      ),
    ));
  }
}
