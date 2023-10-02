import 'package:studyapp/store/pomodoroStore.dart';

class Study{

  int workTime;
  int breakTime;
  String title;
  String? description;
  int totalTimeofStudy = 0;
  final pomodoroStore = PomodoroStore();

  Study({required this.workTime, required this.breakTime, required this.title, this.description});

  void setTime(){
    pomodoroStore.minutos = workTime;
  }


}