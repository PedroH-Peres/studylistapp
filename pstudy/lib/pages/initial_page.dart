import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: ()=>Navigator.of(context).pushReplacementNamed('/home'),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 219, 159, 230),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "Study List",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.menu_book_rounded, size: 80, color: Colors.white,),
              Text("By: Pedro H. Peres (Playyy)", style: TextStyle(fontSize: 17, color: Colors.white),),
              SizedBox(height: 120,),
              Text("Click anywhere to continue", style: TextStyle(color: Colors.white),)
      
            ],
          ),
        ),
      ),
    );
  }
}
