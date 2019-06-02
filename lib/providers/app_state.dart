import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _dataUrl = "https://reqres.in/api/users?per_page=20";

  AppState();

  String _displayText = "";
  String _jsonResponse = "";
  bool _isFetching = false;

  void setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }

  String get getDisplayText => _displayText;

  bool get isFetching => _isFetching;

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
      _jsonResponse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  String get gerResponseText => _jsonResponse;

  List<dynamic> getResponseJson() {
    if (_jsonResponse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(_jsonResponse);
      return json['data'];
    }
    return null;
  }
}