// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoroStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PomodoroStore on _PomodoroStore, Store {
  late final _$timeAtom = Atom(name: '_PomodoroStore.time', context: context);

  @override
  int get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(int value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$_PomodoroStoreActionController =
      ActionController(name: '_PomodoroStore', context: context);

  @override
  void setTime(int value) {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.setTime');
    try {
      return super.setTime(value);
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
time: ${time}
    ''';
  }
}
