import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/store/studyList.store.dart';

import '../models/study.dart';

class StudyFormPage extends StatefulWidget {
  const StudyFormPage({super.key});

  @override
  State<StudyFormPage> createState() => _StudyFormPageState();
}

class _StudyFormPageState extends State<StudyFormPage> {
  @override
  Widget build(BuildContext context) {
    var listStore = Provider.of<StudyListStore>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        child: Observer(
          builder: (_)=>Column(
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
                  child: ListView.builder(
                      itemCount: listStore.studyList.length,
                      itemBuilder: (cxt, index) => GestureDetector(
                        onTap: null,
                        child: Card(
                          child: ListTile(
                            title: Text(listStore.studyList[index].title),
                            leading: Icon(Icons.menu_book_outlined),
                            trailing: Text(listStore.studyList[index].workTime.toString()),
                            subtitle: Text(listStore.studyList[index].description ??''),
                            subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  listStore.addStudy(Study(workTime: 8, breakTime: 2, title: "Teste2", description: "Isso é uma descrição!"));
                },
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
      ),
    );
  }
}
