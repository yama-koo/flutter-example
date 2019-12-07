import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('setting'),
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
