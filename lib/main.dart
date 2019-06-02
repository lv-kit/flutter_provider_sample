import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_test/app_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<AppState>(
        builder: (_) => AppState(),
        child: MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextDisplay(),
              TextEditWidget()
            ],
          )
          ),
      ),
    );
  }
}

class TextDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        appState.getDisplayText,
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}

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
