import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/pages/homepage.dart';
import 'package:studyapp/pages/initial_page.dart';
import 'package:studyapp/store/bottomNav.store.dart';
import 'package:studyapp/store/studyList.store.dart';

void main() {
  runApp(const StudyApp());
}

class StudyApp extends StatelessWidget {
  const StudyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BottomNavStore>(create: (context) => BottomNavStore(),),
        Provider<StudyListStore>(create: (context) => StudyListStore(),),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
