import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pstudy/store/studyList.store.dart';
import 'package:pstudy/store/studyList.store.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  TextEditingController notecontroller = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final studyListStore = Provider.of<StudyListStore>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Notes",
            style: TextStyle(fontFamily: "Kanit", fontSize: 34),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Observer(builder: (_)=> TextFormField(
                controller: notecontroller,
                maxLength: 2000,
                maxLines: 40,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Colors.black), //<-- SEE HERE
                  ),
                ),
                                  ),)),
          ),
          TextButton(onPressed: (){
           
          }, child: const Text("Save", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
          const SizedBox(height: 20,)

        ],
      ),
    );
  }
}
