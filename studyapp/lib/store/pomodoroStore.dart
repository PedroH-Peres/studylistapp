import 'package:mobx/mobx.dart';

part 'pomodoroStore.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store{

  @observable
  int time = 0;

  @action
  void setTime(int value){
    time=value;
  }

}