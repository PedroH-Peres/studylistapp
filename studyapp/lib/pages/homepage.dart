import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/components/BotNavBar.dart';
import 'package:studyapp/pages/overview.dart';
import 'package:studyapp/pages/pomodorocfg.dart';
import 'package:studyapp/pages/studyformpage.dart';
import 'package:studyapp/store/bottomNav.store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navStore = Provider.of<BottomNavStore>(context);

    final _pages = [OverviewPage(), StudyFormPage(), PomodoroPage()];

    return Scaffold(
        appBar: AppBar(
          title: Text("P Study", style: TextStyle(fontFamily: "Kanit"),),
          elevation: 5,
        ),
        bottomNavigationBar: Observer(
          builder: (_)=>StudyBottomNav(
            index: navStore.index,
            change: navStore.changeIndex,
          ),
        ),
        body: Observer(builder:(_)=> _pages[navStore.index]));
  }
}
