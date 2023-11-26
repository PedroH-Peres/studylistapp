import 'package:flutter/material.dart';


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
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.notes), label: "Notes"),
      ],
    );
  }
}
