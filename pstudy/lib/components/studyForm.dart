
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pstudy/models/study.dart';
import 'package:pstudy/store/studyList.store.dart';


class StudyForm extends StatefulWidget {
  const StudyForm({super.key});

  @override
  State<StudyForm> createState() => _StudyFormState();
}

class _StudyFormState extends State<StudyForm> {
  final formKey = GlobalKey<FormState>();

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descController = TextEditingController();
    final TextEditingController _workController = TextEditingController();
    final TextEditingController _breakController = TextEditingController();
    bool isEdit = false;
    bool onEdit = false;
  @override
  Widget build(BuildContext context) {

    
    final arg = ModalRoute.of(context)?.settings.arguments;

    if (arg != null && onEdit==false) {
      final study = arg as Study;
      isEdit = true;
      _titleController.text = arg.title;
      _descController.text = arg.description!;
      _workController.text = arg.workTime.toString();
      _breakController.text = arg.breakTime.toString();
      onEdit = true;
    }
    


    final studyListStore = Provider.of<StudyListStore>(context);

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*3/4,
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Add Study",
                  style: TextStyle(fontSize: 24, fontFamily: "Kanit"),
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(label: Text("Title")),
                  maxLength: 35,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(label: Text("Description")),
                  maxLength: 100,
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
                          decoration: const InputDecoration(
                            label: Text("Work Time"),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _breakController,
                          decoration: const InputDecoration(
                            label: Text("Break Time"),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (int.tryParse(value!) == null) {
                              return "Invalid";
                            }

                            if (value.isNotEmpty) {
                              if (int.tryParse(value)! < 0) {
                                return "Invalid value";
                              }
                            } else {
                              return "Required field";
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (isEdit) {
                        var arg = ModalRoute.of(context)!.settings.arguments;
                        var study = arg as Study;
                        study.title = _titleController.text;
                        study.description = _descController.text;
                        study.breakTime = int.tryParse(_breakController.text)!;
                        study.workTime = int.tryParse(_workController.text)!;
                        studyListStore.edit(study);
                      } else {
                        int wTime = int.tryParse(_workController.text)!, bTime = int.tryParse(_breakController.text)!;
                        if(wTime > 60) wTime = 60;
                        if(bTime > 60) bTime = 60;

                        Study study = Study(
                            workTime: wTime,
                            breakTime: bTime,
                            title: _titleController.text,
                            description: _descController.text);
                        studyListStore.addStudy(study);
                        study.setTime();
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Done"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
