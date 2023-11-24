import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studyapp/store/studyList.store.dart';

class PomodoroPage extends StatefulWidget {
  PomodoroPage({super.key});

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
          Text(
            "Notes",
            style: TextStyle(fontFamily: "Kanit", fontSize: 34),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(8),
                child: Observer(builder: (_)=> FutureBuilder(
                  future: studyListStore.getNotes(),
                  builder: (ctx, snapshot) { 

                    if(notecontroller.text.isEmpty){
                      notecontroller.text = snapshot.data.toString();
                    }

                    return TextFormField(
                    controller: notecontroller,
                    maxLength: 2000,
                    maxLines: 40,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.black), //<-- SEE HERE
                      ),
                    ),
                  );
                }
                ),)),
          ),
          TextButton(onPressed: (){
            studyListStore.saveNotes(notecontroller.text);
          }, child: Text("Save", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
          SizedBox(height: 20,)

        ],
      ),
    );
  }
}
