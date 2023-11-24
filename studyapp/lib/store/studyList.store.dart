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
  Future<String> getNotes() async{
    final _notes = await DB.getData('notes');
    final notes;
    if(_notes.length >= 1){
      notes = _notes[0]['texto'] as String;
    }else{
      notes = '';
    }
    
    return notes;
  }

  void saveNotes(String text)async{
    final _notes = await DB.getData('notes');
    if(_notes.isEmpty){
      DB.insert('notes', {'id': 0, 'texto': text});
    }else{
      DB.updateNote(text);
    }
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

    final _listMap = await DB.getData('studies');
    ObservableList<Study> lista = ObservableList<Study>.of([]);
    for (int i = 0; i < _listMap.length; i++) {
      lista.add(
        Study(
            id: int.parse(_listMap[i]['id'].toString()),
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