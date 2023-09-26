import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 206, 111, 223),
            ),
            child: Column(
              children: [
                SizedBox(height: 15,),
                Text(
                  "Estudos",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                Padding(child: Divider(), padding: EdgeInsets.symmetric(horizontal: 18),),
                Container(
                  
                )
              ],
            ),
          ));
  }
}