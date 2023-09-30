import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

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
    tamanho++;
  }

  @action
  void removeStudy(int index){
    studyList.removeAt(index);
  }

  @action
  List getStudyList(){
    return studyList;
  }

}