import 'package:app_localization_example/locale/locales.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int rdBtnValue = 0;
  Locale enLocale = Locale('en', '');
  Locale hiLocale = Locale('hi', '');
  @override
  Widget build(BuildContext context) {
    final appTxt = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appTxt.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                  value: 0,
                  groupValue: rdBtnValue,
                  onChanged: (value) async {
                    await AppLocalizations.load(enLocale);
                    setState(() {
                      rdBtnValue = value;
                    });
                  }),
              Text(appTxt.englishText),
              Radio(
                  value: 1,
                  groupValue: rdBtnValue,
                  onChanged: (value) async {
                    setState(() {
                      rdBtnValue = value;
                    });
                    await AppLocalizations.load(hiLocale);
                  }),
              Text(appTxt.hindiText),
            ],
          ),
          Text(appTxt.title),
          Text(AppLocalizations.of(context).buttonText),
        ],
      ),
    );
  }
}
