import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier{
  late SharedPreferences _prefs;
  Map<String, String> configList = {};

  AppSettings(){
    _startSettings();
  }

  _startSettings() async {
    await _startPreferrences();
    await _readInfo();
  }

  Future<void> _startPreferrences() async{
    _prefs = await SharedPreferences.getInstance();
  }

  _readInfo(){
      
  }

  setInfo(){
     
  }

}