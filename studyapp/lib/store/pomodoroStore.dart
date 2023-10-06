import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';

part 'pomodoroStore.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum timeType{WORK, BREAK}



abstract class _PomodoroStore with Store{

  @observable
  int time = 0;

  int workTime = 0;
  int breakTime = 0;

  @observable
  bool iniciado = false;

  @observable
  int minutos = 0;

  @observable
  int segundos = 0;

  Timer? cronometro;

  @observable
  timeType tType = timeType.WORK;

  @observable
  int total = 0;


  @action
  void initTimer(){
    if(iniciado == true) return;

    cronometro = Timer.periodic(Duration(seconds: 1), (timer) {
      iniciado = true;
      if(minutos == 0 && segundos ==0){
        //aqui é pra trocar o tipo de intervalo
        _toggleType();
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
  void _toggleType(){
    AudioPlayer player = new AudioPlayer();
    const alarmAudioPath = "transiction.mp3";
    player.play(AssetSource("transiction.mp3"));

    if(tType == timeType.WORK){
      tType = timeType.BREAK;
      minutos = breakTime;
    }else{
      tType = timeType.WORK;
      minutos = workTime;
    }
  }

  @action
  void stopTimer(){
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void resetTimer(){
    stopTimer();
    tType = timeType.WORK;
    segundos = 0;
  }

}