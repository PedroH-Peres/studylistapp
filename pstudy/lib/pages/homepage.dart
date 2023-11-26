import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pstudy/components/BotNavBar.dart';
import 'package:pstudy/pages/notepage.dart';
import 'package:pstudy/pages/overview.dart';
import 'package:pstudy/pages/studyformpage.dart';
import 'package:pstudy/store/bottomNav.store.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navStore = Provider.of<BottomNavStore>(context);

    final pages = [const OverviewPage(), const StudyFormPage(), const PomodoroPage()];

    return Scaffold(
        appBar: AppBar(
          title: const Text("P Study", style: TextStyle(fontFamily: "Kanit"),),
          elevation: 5,
        ),
        bottomNavigationBar: Observer(
          builder: (_)=>StudyBottomNav(
            index: navStore.index,
            change: navStore.changeIndex,
          ),
        ),
        body: Observer(builder:(_)=> pages[navStore.index]));
  }
}
