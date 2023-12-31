import 'package:mobx/mobx.dart';

import '../core/database.dart';
import '../models/study.dart';

part 'studyList.store.g.dart';

class StudyListStore = _StudyListStore with _$StudyListStore;

abstract class _StudyListStore with Store {

  

  @observable
  ObservableList<Study> studyList = ObservableList<Study>.of([]);

  @observable
  int tamanho = 0;

  @action
  void addStudy(Study study){
    studyList.add(study);
    DB.insert('studies', study.toMap());
    tamanho++;
  }


  @action
  removeStudy(int index) async{
    print(studyList[index].id.toString());
    DB.remove(studyList[index].id.toString());
    studyList.removeAt(index);
  }

  @action
  edit(Study study){
    DB.edit(study);
  }

  @action
  Future<List> getStudyList() async{

    final listMap = await DB.getData('studies');
    ObservableList<Study> lista = ObservableList<Study>.of([]);
    for (int i = 0; i < listMap.length; i++) {
      lista.add(
        Study(
            id: int.parse(listMap[i]['id'].toString()),
            workTime: int.parse(listMap[i]['worktime'].toString()),
            breakTime: int.parse(listMap[i]['breaktime'].toString()),
            title: listMap[i]['title'].toString(),
            description: (listMap[i]['description'] ?? '').toString(),)
      );
    }
    studyList = lista;
    return studyList;
  }

}