import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:studyapp/store/pomodoroStore.dart';

import '../models/study.dart';

class StudyPage extends StatelessWidget {
  Study study;
  StudyPage({required this.study, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 221, 162, 231),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                child: Text(
                  study.title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Observer(
                builder: (_) => Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Description: ${study.description}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          study.pomodoroStore.tType == timeType.WORK ?
                          "WORK" : "BREAK",
                          style: TextStyle(
                              color: study.pomodoroStore.tType == timeType.WORK ? Colors.purple: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                              border: Border.all(width: 4, color: study.pomodoroStore.tType == timeType.WORK ? Colors.purple: Colors.green),
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "${study.pomodoroStore.minutos.toString().padLeft(2, "0")}:${study.pomodoroStore.segundos.toString().padLeft(2, "0")}",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Work Time: [ ${study.workTime} ] / Break Time: [ ${study.breakTime} ]\nTotal Time: [ ${study.pomodoroStore.total} ]",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: study.pomodoroStore.initTimer,
                              icon: Icon(Icons.play_arrow),
                              iconSize: MediaQuery.of(context).size.width / 8,
                            ),
                            IconButton(
                              onPressed: study.pomodoroStore.stopTimer,
                              icon: Icon(Icons.pause),
                              iconSize: MediaQuery.of(context).size.width / 8,
                            ),
                            IconButton(
                              onPressed: () {
                                study.pomodoroStore.resetTimer();
                                study.setTime();
                              },
                              icon: Icon(Icons.refresh),
                              iconSize: MediaQuery.of(context).size.width / 8,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  alignment: Alignment.center,
                  color: const Color.fromARGB(255, 221, 162, 231),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 10,
                  child: Text(
                    "Voltar",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
