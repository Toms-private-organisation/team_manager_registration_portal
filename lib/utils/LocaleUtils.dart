import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class LocaleUtils{
  static String currency(BuildContext context) {
    // Locale locale = Localizations.;
    // // Locale locale = Localizations.localeOf(context);
    // var format = NumberFormat.simpleCurrency(locale: locale.toString());
    // print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    // print("CURRENCY NAME ${format.currencyName}"); // USD
    return "EUR";
  }
}