import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  ThemeData _themeData;

  ThemeState(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}