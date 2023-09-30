import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/models/study.dart';
import 'package:studyapp/store/studyList.store.dart';

class StudyForm extends StatelessWidget {
  StudyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _descController = TextEditingController();
    final _workController = TextEditingController();
    final _breakController = TextEditingController();
    final studyListStore = Provider.of<StudyListStore>(context);
    final _formKey = GlobalKey<FormState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.white),
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(label: Text("Title")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(label: Text("Description")),
                validator: (value) {
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextFormField(
                      controller: _workController,
                      decoration: InputDecoration(
                        label: Text("WorkTime"),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return null;
                      },
                                    ),
                    ),
                  ),
                  SizedBox(width: 100,),
                Expanded(
                  child: Container(
                    child: TextFormField(
                      controller: _breakController,
                      decoration: InputDecoration(
                        label: Text("BreakTime"),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                ),
                  
                ],
              ),
              SizedBox(
                height: 12,
              ),
              TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      studyListStore.addStudy(Study(
                          workTime: int.tryParse(_workController.text)!,
                          breakTime: int.tryParse(_breakController.text)!,
                          title: _titleController.text,
                          description: _descController.text));
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Done"))
            ],
          ),
        ),
      ),
    );
  }
}
