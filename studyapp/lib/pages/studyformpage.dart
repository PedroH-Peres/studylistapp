import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/components/studyForm.dart';
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
          builder: (_) => Column(
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
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 215, 174, 223),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listStore.studyList.length,
                    itemBuilder: (cxt, index) => GestureDetector(
                      onTap: null,
                      child: Card(
                        child: ListTile(
                            title: Text(listStore.studyList[index].title),
                            leading: Icon(Icons.menu_book_outlined),
                            subtitle: Text(
                                listStore.studyList[index].description ?? ''),
                            subtitleTextStyle:
                                TextStyle(color: Colors.grey, fontSize: 11),
                            trailing: Container(
                              height: 50,
                              width: 80,
                              child: Row(children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.delete)),
                              ]),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  listStore.addStudy(Study(
                      workTime: 8,
                      breakTime: 2,
                      title: "Teste2",
                      description: "Isso é uma descrição!"));
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return StudyForm();
                      });
                },
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(490, 50),
                    maximumSize: Size(600, 50),
                    backgroundColor: Color.fromARGB(255, 206, 111, 223),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
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
