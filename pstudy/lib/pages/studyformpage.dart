import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pstudy/components/studyForm.dart';
import 'package:pstudy/store/studyList.store.dart';


class StudyFormPage extends StatefulWidget {
  const StudyFormPage({super.key});

  @override
  State<StudyFormPage> createState() => _StudyFormPageState();
}

class _StudyFormPageState extends State<StudyFormPage> {
  @override
  Widget build(BuildContext context) {
    var listStore = Provider.of<StudyListStore>(context);

    return SizedBox(
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
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 215, 174, 223),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FutureBuilder(
                    future: listStore.getStudyList(),
                    builder: (context, snapshot) { 
                      if (snapshot.connectionState == ConnectionState.none &&
                          snapshot.hasData == null) {
                        //print('project snapshot data is: ${projectSnap.data}');
                        return Container(child: const Center(child: CircularProgressIndicator(),),);
                      }
                      return Observer(
                        builder: (_) => ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: listStore.studyList.length,
                        itemBuilder: (cxt, index) => GestureDetector(
                          onTap: null,
                          child: Card(
                            child: ListTile(
                                title: Text(listStore.studyList[index].title),
                                leading: const Icon(Icons.menu_book_outlined),
                                subtitle: Text(
                                    listStore.studyList[index].description ?? ''),
                                subtitleTextStyle:
                                    const TextStyle(color: Colors.grey, fontSize: 11),
                                trailing: SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*2/8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                    IconButton(
                                        onPressed: () {
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> StudyForm(), settings: RouteSettings(arguments: listStore.studyList[index])), ).then((value) => setState((){}));
                                          showModalBottomSheet(
                                                  context: context,
                                                  builder: (_) => const StudyForm(),
                                                  enableDrag: false,
                                                  routeSettings: RouteSettings(
                                                      arguments: listStore
                                                          .studyList[index]))
                                              .then((value) => setState(() {}));
                                        },
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          listStore.removeStudy(index);
                                        },
                                        icon: const Icon(Icons.delete)),
                                  ]),
                                )),
                          ),
                        ),
                                          ),
                      );}
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: ElevatedButton(
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> StudyForm()), );
                    showModalBottomSheet(
                        context: context,
                        builder: (_) => const StudyForm(),
                        enableDrag: false).then((value) => setState((){}));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(490, 50),
                      maximumSize: const Size(600, 50),
                      backgroundColor: const Color.fromARGB(255, 206, 111, 223),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Icon(Icons.add),
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
