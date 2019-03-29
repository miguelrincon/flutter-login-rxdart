import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final Bloc bloc = Bloc();
  bool updateShouldNotify(_) => true;

  // https://www.dartlang.org/guides/language/language-tour#initializer-list
  Provider({Key key, Widget child}) : super(key: key, child: child);

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
