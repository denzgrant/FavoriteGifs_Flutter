import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _notifier = ValueNotifier<ThemeModel>(ThemeModel(ThemeMode.light));

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModel>(
      valueListenable: _notifier,
      builder: (_, model, __) {
        final mode = model.mode;
        return MaterialApp(
          //light theme
          theme: ThemeData(
            primarySwatch: Colors.grey,
            primaryColor: Colors.white,
            brightness: Brightness.light,
            backgroundColor: const Color(0xFFE5E5E5),
            accentColor: Colors.black,
            accentIconTheme: IconThemeData(color: Colors.white),
            dividerColor: Colors.white54,
          ), // Provide light theme.
          //dark theme
          darkTheme: ThemeData(
            primarySwatch: Colors.grey,
            primaryColor: Colors.black,
            brightness: Brightness.dark,
            backgroundColor: const Color(0xFF212121),
            accentColor: Colors.white,
            accentIconTheme: IconThemeData(color: Colors.black),
            dividerColor: Colors.black12,
          ), // Provide dark theme.
          themeMode: mode, // Decides which theme to show.
          home: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('My Favorite Gifs')),
              actions: [
                InkWell(
                  child: Icon(Icons.lightbulb_outline_rounded, size: 40),
                  onTap: () => _notifier.value = ThemeModel(
                      mode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Map',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Map',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Map',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ThemeModel with ChangeNotifier {
  final ThemeMode _mode;
  ThemeMode get mode => _mode;

  ThemeModel(this._mode);
}
