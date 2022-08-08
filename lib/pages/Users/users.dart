import 'package:flutter/material.dart';
import 'package:splash/pages/Users/Leaderboard/leaderboard.dart';
import 'package:splash/pages/Users/Leaderboard/table.dart';
import 'package:splash/pages/Users/Profile/profile.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: currentIndex == 0 ? Profile() : Leaderbord(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'User',
            icon: Icon(
              Icons.supervised_user_circle,
            ),
            backgroundColor: Color.fromARGB(255, 235, 246, 229),
          ),
          BottomNavigationBarItem(
            label: 'Leaderboard',
            icon: Icon(Icons.bar_chart_outlined),
            backgroundColor: Color.fromARGB(255, 235, 246, 229),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
