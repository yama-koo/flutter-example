import 'package:app/routes.dart';
import 'package:app/screens.dart';
import 'package:flutter/material.dart';
import 'bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List listItem = ['西野千明', '小野寺梓', '橋本美桜', '麦田ひかる', '三浦菜々子', '鈴木えま'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      // initialRoute: '/',
      routes: {
        // '/': (context) => FirstScreen(),
        // '/second': (context) => SecondScreen(),
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final ScreenArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
      },
      home: HomeScreen(),
      // home: FirstRoute(),
      // Scaffold(
      //   appBar: AppBar(
      //     title: Text('真っ白なキャンパス'),
      //   ),
      //   body: Container(
      //     child: ListView.builder(
      //       itemBuilder: (BuildContext context, int index) {
      //         return ListTile(
      //           title: Text(listItem[index % 6]),
      //           key: UniqueKey(),
      //         );
      //       },
      //       itemCount: 200,
      //     ),
      //   ),
      //   bottomNavigationBar: BottomBar(),
      // ),
    );
  }
}
