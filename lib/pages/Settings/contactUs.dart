import 'package:flutter/material.dart';
import 'package:splash/Components/title.dart';
import 'package:splash/pages/Settings/setting.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BackTitle(
            title:
                "Contact                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ",
            destination: const Settings(),
          ),
        ],
      ),
    );
  }
}
