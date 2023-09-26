import 'package:flutter/material.dart';

import '../models/study.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Study> studyList = [
      Study(workTime: 5, breakTime: 1, title: "Teste")
    ];

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
                  child: GestureDetector(
                    onTap: (){
                      studyList[0].incTotalTime(1);
                      print(studyList[0].totalTimeofStudy);
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Text(studyList[0].title),
                        trailing: Text(studyList[0].workTime.toString()),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
  }
}