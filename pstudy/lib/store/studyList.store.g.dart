// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studyList.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudyListStore on _StudyListStore, Store {
  late final _$studyListAtom =
      Atom(name: '_StudyListStore.studyList', context: context);

  @override
  ObservableList<Study> get studyList {
    _$studyListAtom.reportRead();
    return super.studyList;
  }

  @override
  set studyList(ObservableList<Study> value) {
    _$studyListAtom.reportWrite(value, super.studyList, () {
      super.studyList = value;
    });
  }

  late final _$tamanhoAtom =
      Atom(name: '_StudyListStore.tamanho', context: context);

  @override
  int get tamanho {
    _$tamanhoAtom.reportRead();
    return super.tamanho;
  }

  @override
  set tamanho(int value) {
    _$tamanhoAtom.reportWrite(value, super.tamanho, () {
      super.tamanho = value;
    });
  }

  late final _$removeStudyAsyncAction =
      AsyncAction('_StudyListStore.removeStudy', context: context);

  @override
  Future removeStudy(int index) {
    return _$removeStudyAsyncAction.run(() => super.removeStudy(index));
  }

  late final _$getStudyListAsyncAction =
      AsyncAction('_StudyListStore.getStudyList', context: context);

  @override
  Future<List<dynamic>> getStudyList() {
    return _$getStudyListAsyncAction.run(() => super.getStudyList());
  }

  late final _$_StudyListStoreActionController =
      ActionController(name: '_StudyListStore', context: context);

  @override
  void addStudy(Study study) {
    final _$actionInfo = _$_StudyListStoreActionController.startAction(
        name: '_StudyListStore.addStudy');
    try {
      return super.addStudy(study);
    } finally {
      _$_StudyListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic edit(Study study) {
    final _$actionInfo = _$_StudyListStoreActionController.startAction(
        name: '_StudyListStore.edit');
    try {
      return super.edit(study);
    } finally {
      _$_StudyListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
studyList: ${studyList},
tamanho: ${tamanho}
    ''';
  }
}
