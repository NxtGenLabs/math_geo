import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: IconButton(
        onPressed: ()=> Navigator.pop(context),
        icon: const Icon(Icons.arrow_back)),
    );
  }
}