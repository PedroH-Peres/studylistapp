import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../store/bottomNav.store.dart';

class StudyBottomNav extends StatelessWidget {

  final Function(int) change;
  final int index;

  const StudyBottomNav({required this.change, required this.index,super.key});

  

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        change(value);
      },
      currentIndex: index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
