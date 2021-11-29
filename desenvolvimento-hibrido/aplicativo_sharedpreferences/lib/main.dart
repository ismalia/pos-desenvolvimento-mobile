import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(AplicativoSharedPreferences());
}

class AplicativoSharedPreferences extends StatefulWidget {
  @override
  _AplicativoSharedPreferencesState createState() => _AplicativoSharedPreferencesState();
}

class _AplicativoSharedPreferencesState extends State<AplicativoSharedPreferences> {
  String _theme = "Light";
  var _themeData = ThemeData.light();

  _loadTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _theme = sharedPreferences.getString("theme") ?? "Light";
      _themeData = _theme == "Dark" ? ThemeData.dark() : ThemeData.light();
    });
  }

  _setTheme(theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _theme = theme;
      _themeData = theme == "Dark" ? ThemeData.dark() : ThemeData.light();
      sharedPreferences.setString("theme", theme);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SharedPreferences"),
          centerTitle: true,
          actions: [PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white,),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                child: Text("Configurar Tema"),
              ),
              PopupMenuItem<String>(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: _theme == "Light" ? true : false,
                      child: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    ),
                    const Text("Light"),
                  ],
                ),
                onTap: () {_setTheme("Light");},
              ),
              PopupMenuItem<String>(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: _theme == "Dark" ? true : false,
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    ),
                    const Text("Dark"),
                  ],
                ),
                onTap: () {_setTheme("Dark");},
              ),
            ],
          ),],
        ),
      )
    );
  }
}