import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: buildHomePage("真っ白なキャンパス"),
    );
  }

  Widget _buildList() {
    var tiles = new List<Widget>();
    for (var i = 0; i < 6; i++) {
      tiles.add(_tile('西野千明', '真っ白なキャンパス', Icons.theaters));
      tiles.add(_tile('小野寺梓', '真っ白なキャンパス', Icons.theaters));
      tiles.add(_tile('麦田ひかる', '真っ白なキャンパス', Icons.theaters));
      tiles.add(_tile('橋本美桜', '真っ白なキャンパス', Icons.theaters));
      tiles.add(_tile('三浦菜々子', '真っ白なキャンパス', Icons.theaters));
      tiles.add(_tile('鈴木えま', '真っ白なキャンパス', Icons.theaters));
    }
    return ListView(
      children: tiles,
    );
  }

  Dismissible _tile(String title, String subTitle, IconData icon) =>
      Dismissible(
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          subtitle: Text(subTitle),
          leading: Icon(
            icon,
            color: Colors.blue[500],
          ),
        ),
        background: Container(
          color: Colors.red,
        ),
        secondaryBackground: Container(
          color: Colors.green,
        ),
        key: UniqueKey(),
      );

  Widget _logo() => Image(
        image: NetworkImage('http://shirokyan.com/images/fix_rgb_wht.png'),
        fit: BoxFit.contain,
      );

  Widget buildHomePage(String title) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              LimitedBox(
                maxHeight: 400,
                child: _buildList(),
              ),
              Divider(
                thickness: 1,
              ),
              _logo(),
            ],
          ),
        ),
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /* 1 */ (context, i) {
          if (i.isOdd) return Divider(); /* 2 */

          final index = i ~/ 2; /* 3 */
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /* 4 */
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
