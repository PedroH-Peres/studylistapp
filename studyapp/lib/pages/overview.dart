import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/pages/studyPage.dart';
import 'package:studyapp/store/studyList.store.dart';

import '../models/study.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    List studyList = Provider.of<StudyListStore>(context).getStudyList();

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.all(12),
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
                  margin: EdgeInsets.all(1),
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                  child: ListView.builder(
                    itemCount: studyList.length,
                    itemBuilder: (cxt, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                StudyPage(study: studyList[index]))).then((value) => studyList[index].pomodoroStore.stopTimer());
                      },
                      child: Card(
                        child: Observer(
                          builder: (_) => ListTile(
                            title: Text(studyList[index].title),
                            leading: Icon(Icons.menu_book_outlined),
                            trailing: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color:
                                          Color.fromARGB(125, 182, 180, 180),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Text(
                                      "[${studyList[index].pomodoroStore.minutos.toString().padLeft(2, '0')}:${studyList[index].pomodoroStore.segundos.toString().padLeft(2, '0')}]",
                                      style: TextStyle(fontSize: 13)),
                                ),
                            
                            subtitle: Text("Work: ${studyList[index].workTime} / Break: ${studyList[index].breakTime} - [ T: ${studyList[index].pomodoroStore.total} ]"),
                            subtitleTextStyle:
                                TextStyle(color: Colors.grey, fontSize: 11),
                          ),
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
