import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoroStore.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store{

  @observable
  int time = 0;

  @observable
  bool iniciado = false;

  @observable
  int minutos = 0;

  @observable
  int segundos = 0;

  Timer? cronometro;

  @observable
  int total = 0;

  @action
  void setTime(int value){
    time=value;
  }

  @action
  void initTimer(){
    if(iniciado == true) return;

    cronometro = Timer.periodic(Duration(seconds: 1), (timer) {
      iniciado = true;
      if(minutos == 0 && segundos ==0){
        //aqui é pra trocar o tipo de intervalo
        cronometro?.cancel();
      }else if(segundos==0){
        minutos--;
        segundos = 59;
      }else{
        segundos--;
      }
      time++;
      if(time >= 60){
        time = 0;
        total++;
      }
    });
  }

  @action
  void stopTimer(){
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void resetTimer(){
    stopTimer();
    segundos = 0;
  }

}