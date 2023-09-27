import 'package:flutter/material.dart';

class StudyFormPage extends StatelessWidget {
  const StudyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Study List",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(22),
                color: Colors.purple,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(480, 50),
                maximumSize: Size(600, 50),
                backgroundColor: Color.fromARGB(255, 206, 111, 223),
                foregroundColor: Colors.white
              ),
            ),
            const SizedBox(
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}
