import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studyapp/store/studyList.store.dart';

class PomodoroPage extends StatelessWidget {
  PomodoroPage({super.key});

  TextEditingController notecontroller = TextEditingController();

  Future<String> getText() async{
    final nota = await StudyListStore().getNotes();
    return nota;
  }

  @override
  Widget build(BuildContext context) {

    if(notecontroller.text.isEmpty){
    }
    
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
                child: Observer(builder: (_)=> TextFormField(
                  controller: notecontroller,
                  maxLength: 2000,
                  maxLines: 40,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Colors.black), //<-- SEE HERE
                    ),
                  ),
                ),)),
          ),
          TextButton(onPressed: (){
            StudyListStore().saveNotes(notecontroller.text);
          }, child: Text("Save", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
          SizedBox(height: 20,)

        ],
      ),
    );
  }
}
