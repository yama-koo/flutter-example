import 'package:app/models/word.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage(this.word);
  final Word word;

  static const routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    final tiles = word.items.map(
      (item) {
        // return new ListTile(
        return ListTile(
          // title: Text(item.name),
          title: new Text(item.name),
        );
      },
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    // return new Scaffold(
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Favorite"),
      ),
      // body: new ListView(
      body: ListView(
        children: divided,
      ),
    );
  }
}
