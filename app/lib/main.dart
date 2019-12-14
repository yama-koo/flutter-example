import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar'),
        ),
        body: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                // Container(
                //   // child: FlutterLogo(),
                //   width: 100,
                //   height: 100,
                //   child: Text('hoge'),
                // ),
                ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.add_circle_outline),
                      FlutterLogo(),
                    ],
                  ),
                  title: Text('いろは唄口上'),
                ),
              ],
              //   ),
              // ],
            ),
          ),
        ),
      ),
    );
  }
}
