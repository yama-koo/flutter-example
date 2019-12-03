import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List listItem = ['西野千明', '小野寺梓', '橋本美桜', '麦田ひかる', '三浦菜々子', '鈴木えま'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('真っ白なキャンパス'),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(listItem[index % 6]),
                key: UniqueKey(),
              );
            },
            itemCount: 200,
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

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
