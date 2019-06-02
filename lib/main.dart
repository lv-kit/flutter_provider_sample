import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/text_display.dart';
import 'package:provider_test/response_display.dart';
import 'package:provider_test/text_edit_widget.dart';
import 'package:provider_test/providers/app_state.dart';
import 'package:provider_test/providers/theme_state.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeState>(
      builder: (_) => ThemeState(ThemeData.light()),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeState>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.getTheme(),
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
    final appState = Provider.of<AppState>(context);
    ThemeState _themeState = Provider.of<ThemeState>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _themeState.setTheme(ThemeData.dark()),
                  child: Text(
                    "Dark Theme"
                  ),
                ),
                RaisedButton(
                  onPressed: () => _themeState.setTheme(ThemeData.light()),
                  child: Text(
                      "Light Theme"
                  ),
                ),
                TextDisplay(),
                TextEditWidget(),
                RaisedButton(
                  onPressed: () => appState.fetchData(),
                  child: Text("Fetch Data from Network"),
                ),
                ResponseDisplay()
              ],
            )
            ),
        ),
      ),
    );
  }
}
