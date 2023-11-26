
import 'package:pstudy/store/pomodoroStore.dart';

class Study{

  int? id;
  int workTime;
  int breakTime;
  String title;
  String? description;
  final pomodoroStore = PomodoroStore();

  Study({this.id ,required this.workTime, required this.breakTime, required this.title, this.description});

  void setTime(){
    pomodoroStore.minutos = workTime;
    pomodoroStore.workTime = workTime;
    pomodoroStore.breakTime = breakTime;
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'description': description,
      'worktime': workTime,
      'breaktime': breakTime
    };
  }


}