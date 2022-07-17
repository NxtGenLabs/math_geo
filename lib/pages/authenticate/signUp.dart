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
              Text("Create an accoun to play"),
              SizedBox(height:20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: InputBorder.none,hintText: 'FullName',hintStyle: TextStyle(color: Colors.grey[300])),
                ),
              ),
              SizedBox(height:20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: InputBorder.none,hintText: 'School',hintStyle: TextStyle(color: Colors.grey[300])),
                ),
              ),
              SizedBox(height:20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: InputBorder.none,hintText: 'Class',hintStyle: TextStyle(color: Colors.grey[300])),
                ),
              ),
              SizedBox(height:20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  obscureText: true,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: InputBorder.none,hintText: 'Password',hintStyle: TextStyle(color: Colors.grey[300])),
                ),
              ),
              SizedBox(height:20),

            ],
          ),
        ),
      ),
    ));
  }
}
