import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/app_state.dart';

class TextEditWidget extends StatefulWidget {
  @override
  _TextEditWidgetState createState() => _TextEditWidgetState();
}

class _TextEditWidgetState extends State<TextEditWidget> {
  TextEditingController _textEditingController;
  
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Container(
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          labelText: "Some Text",
          border: OutlineInputBorder(),
        ),
        onChanged: (changed) => appState.setDisplayText(changed),
        onSubmitted: (submitted) => appState.setDisplayText(submitted),
      ),
    );
  }
}