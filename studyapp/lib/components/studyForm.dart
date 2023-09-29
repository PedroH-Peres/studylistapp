import 'package:flutter/material.dart';

class StudyForm extends StatelessWidget {
  const StudyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.white),
      child: Form(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text("Title")
              ),
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("Description")
              ),
            ),
            SizedBox(height: 12,),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Done"))
          ],
        ),
      ),
    );
  }
}