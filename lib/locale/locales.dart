import 'package:app_localization_example/l10n/messages_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
    
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message(
      'Weather Application',
      name: 'title',
      desc: 'The title of the application',
    );
  }

  String get buttonText {
    return Intl.message(
      'Login',
      name: 'buttonText',
      desc: 'The text on the Login button',
    );
  }

  String get hindiText {
    return Intl.message(
      'Hindi',
      name: 'hindiText',
      desc: 'The text on the hindiText',
    );
  }

  String get englishText {
    return Intl.message(
      'English',
      name: 'englishText',
      desc: 'The text on the englishText',
    );
  }
}


class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations>{
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
      return ['en','hi'].contains(locale.languageCode);
    }
  
    @override
    Future<AppLocalizations> load(Locale locale) {
      return AppLocalizations.load(locale);
    }
  
    @override
    bool shouldReload(AppLocalizationsDelegate old) {
    return false;
  }
}