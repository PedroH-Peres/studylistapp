import 'package:flutter/foundation.dart';
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
  void removeStudy(int index){
    studyList.removeAt(index);
  }

  @action
  Future<List> getStudyList() async{

    final _listMap = await DB.getData('studies');
    ObservableList<Study> lista = ObservableList<Study>.of([]);
    for (int i = 0; i < _listMap.length; i++) {
      lista.add(
        Study(
            workTime: int.parse(_listMap[i]['worktime'].toString()),
            breakTime: int.parse(_listMap[i]['breaktime'].toString()),
            title: _listMap[i]['title'].toString(),
            description: (_listMap[i]['description'] ?? '').toString(),)
      );
    }
    studyList = lista;
    return studyList;
  }

}