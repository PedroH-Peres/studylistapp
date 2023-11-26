import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pstudy/pages/homepage.dart';
import 'package:pstudy/pages/initial_page.dart';
import 'package:pstudy/store/bottomNav.store.dart';
import 'package:pstudy/store/studyList.store.dart';

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
        title: 'Study List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const InitialPage(),
        routes: {
          '/home': (context)=> const HomePage(),
        },
      ),
    );
  }
}
