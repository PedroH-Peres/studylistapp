import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/models/study.dart';
import 'package:studyapp/store/studyList.store.dart';

class StudyForm extends StatefulWidget {
  StudyForm({super.key});

  @override
  State<StudyForm> createState() => _StudyFormState();
}

class _StudyFormState extends State<StudyForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descController = TextEditingController();
    final TextEditingController _workController = TextEditingController();
    final TextEditingController _breakController = TextEditingController();
    bool isEdit = false;

    final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final study = arg as Study;
        isEdit = true;
        _titleController.text = arg.title;
        _descController.text = arg.description!;
        _workController.text = arg.workTime.toString();
        _breakController.text = arg.breakTime.toString();
      }

    final studyListStore = Provider.of<StudyListStore>(context);
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
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
                    SizedBox(
                      width: 100,
                    ),
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
                      if (isEdit) {
                        var arg = ModalRoute.of(context)!.settings.arguments;
                        var study = arg as Study;
                        study.title = _titleController.text;
                        study.description = _descController.text;
                        study.breakTime = int.tryParse(_breakController.text)!;
                        study.workTime = int.tryParse(_workController.text)!;
                      } else {
                        studyListStore.addStudy(Study(
                            workTime: int.tryParse(_workController.text)!,
                            breakTime: int.tryParse(_breakController.text)!,
                            title: _titleController.text,
                            description: _descController.text));
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Done"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Fechar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
