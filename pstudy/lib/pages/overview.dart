import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pstudy/pages/studyPage.dart';
import 'package:pstudy/store/studyList.store.dart';


class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  

  @override
  Widget build(BuildContext context){
    
    Future<List> getStudyList(){
        return Provider.of<StudyListStore>(context).getStudyList();
    }

    List list = Provider.of<StudyListStore>(context).studyList;

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 206, 111, 223),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Estudos",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Divider(),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(1),
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                  child: FutureBuilder(
                    future: getStudyList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none &&
                          snapshot.hasData == null) {
                        //print('project snapshot data is: ${projectSnap.data}');
                        return Container();
                      }
                      return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (cxt, index) { 
                        list[index].setTime();
                        return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  StudyPage(study: list[index]))).then((value) => list[index].pomodoroStore.stopTimer());
                        },
                        child: Card(
                          child: Observer(
                            builder: (_) => ListTile(
                              title: Text(list[index].title ?? ''),
                              leading: const Icon(Icons.menu_book_outlined),
                              trailing: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(125, 182, 180, 180),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Text(
                                        "[${list[index].pomodoroStore.minutos.toString().padLeft(2, '0')}:${list[index].pomodoroStore.segundos.toString().padLeft(2, '0')}]",
                                        style: const TextStyle(fontSize: 13)),
                                  ),
                              
                              subtitle: Text("Work: ${list[index].workTime} / Break: ${list[index].breakTime} - [ T: ${list[index].pomodoroStore.total} ]"),
                              subtitleTextStyle:
                                  const TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                          ),
                        ),
                      );},
                    );}
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
