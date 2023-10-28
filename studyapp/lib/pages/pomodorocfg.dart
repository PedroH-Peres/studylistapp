import 'package:flutter/material.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Coming soon", style: TextStyle(fontSize: 20),),
        SizedBox(height: 60,),
        Text("App developed by Pedro H. Peres (Playyy)", style: TextStyle(fontFamily: "Kanit"),)
      ],
    ),);
  }
}