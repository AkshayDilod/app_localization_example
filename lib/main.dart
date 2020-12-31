import 'package:app_localization_example/home.dart';
import 'package:app_localization_example/locale/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English, no country code
          const Locale('hi', ''), // Hindi, no country code
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context).title,
        theme: ThemeData.light(),
        home: Home());
  }
}
