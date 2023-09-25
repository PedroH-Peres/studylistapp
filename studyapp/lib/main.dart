import 'package:flutter/material.dart';
import 'package:studyapp/pages/homepage.dart';
import 'package:studyapp/pages/initial_page.dart';

void main() {
  runApp(const StudyApp());
}

class StudyApp extends StatelessWidget {
  const StudyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitialPage(),
      routes: {
        '/home': (context)=> HomePage(),
      },
    );
  }
}
