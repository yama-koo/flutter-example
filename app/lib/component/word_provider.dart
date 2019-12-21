import 'package:app/component/word_bloc.dart';
import 'package:flutter/widgets.dart';

class WordProvider extends InheritedWidget {
  final WordBloc wordBloc;

  WordProvider({
    Key key,
    WordBloc wordBloc,
    Widget child,
  })  : wordBloc = wordBloc ?? WordBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static WordBloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<WordProvider>())
          .wordBloc;
}
