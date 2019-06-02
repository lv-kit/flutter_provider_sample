
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  AppState();

  String _dislayText = "";

  void setDisplayText(String text) {
    _dislayText = text;
    notifyListeners();
  }

  String get getDisplayText => _dislayText;
}