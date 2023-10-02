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
    print("Foi");
    cronometro = Timer.periodic(Duration(milliseconds: 100), (timer) {
      print(segundos);
      if(minutos == 0 && segundos ==0){
        //aqui é pra trocar o tipo de intervalo
        print("parou");
        cronometro?.cancel();
      }else if(segundos==0){
        minutos--;
        total++;
        segundos = 59;
      }else{
        segundos--;
      }
    });
  }
}