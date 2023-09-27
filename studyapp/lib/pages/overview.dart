import 'package:flutter/material.dart';

import '../models/study.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Study> studyList = [
      Study(workTime: 5, breakTime: 1, title: "Teste"),
      Study(workTime: 8, breakTime: 2, title: "Teste2", description: "Isso é uma descrição!")
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
              SizedBox(
                height: 15,
              ),
              Text(
                "Estudos",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                child: Divider(),
                padding: EdgeInsets.symmetric(horizontal: 18),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  child: ListView.builder(
                    itemCount: studyList.length,
                    itemBuilder: (cxt, index) => GestureDetector(
                      onTap: null,
                      child: Card(
                        child: ListTile(
                          title: Text(studyList[index].title),
                          leading: Icon(Icons.menu_book_outlined),
                          trailing: Text(studyList[index].workTime.toString()),
                          subtitle: Text(studyList[index].description ??''),
                          subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
