import 'package:flutter/material.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Notes",
            style: TextStyle(fontFamily: "Kanit", fontSize: 34),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  maxLength: 2000,
                  maxLines: 40,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                  ),
                )),
          ),
          TextButton(onPressed: (){}, child: Text("Save", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
          SizedBox(height: 20,)

        ],
      ),
    );
  }
}
