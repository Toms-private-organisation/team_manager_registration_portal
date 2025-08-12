
import 'package:intl/intl.dart';

import '../i18n/strings.g.dart';

class DateTimeUtils{

  static String formatDateTimeToString(DateTime dateTime){
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  static DateTime lastYear(){
    var date = DateTime.now();
    return DateTime(date.year - 1, date.month, date.day);
  }

  static DateTime nextYear(){
    var date = DateTime.now();
    return DateTime(date.year + 1, date.month, date.day);
  }

  static DateTime stringToDateTime(String datetime){
    return DateTime.parse(datetime);
  }

  static String dateTimeStringToReadableString(String datetime){
    DateTime dt = DateTime.parse(datetime);
    return humanReadableShortDateString(dt);
  }

  static DateTime startOfTheDay(DateTime dateTime){
    return new DateTime(dateTime.year, dateTime.month, dateTime.day, 00, 00);
  }

  static DateTime endOfTheDay(DateTime dateTime){
    return new DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59);
  }

  static DateTime startOfTheMonth(){
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year, now.month, 1, 0, 0, 1);
    return dateTime;
  }

  static DateTime endOfTheMonth(){
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year, now.month + 1 , 0, 23, 59, 59);
    return dateTime;
  }

  ///This is used for method that returns data for calendar!
  static String DateTimeToString(DateTime dateTime){
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  static String humanReadableDateTimeString(DateTime dateTime){
    return DateFormat('kk:mm dd-MM-yyyy').format(dateTime);
  }

  static String humanReadableTimeString(DateTime dateTime){
    return DateFormat('kk:mm').format(dateTime);
  }

  static String humanReadableLongDateString(DateTime dateTime){
    var buffer = new StringBuffer();
    buffer.write(dateTime.day.toString() + ". ");
    buffer.write(t.time.months.long[dateTime.month - 1]);
    buffer.write(" " + dateTime.year.toString());
    return buffer.toString();
  }

  static String humanReadableShortDateString(DateTime dateTime){
    var buffer = new StringBuffer();
    buffer.write(dateTime.day.toString() + ". ");
    buffer.write(t.time.months.short[dateTime.month - 1]);
    buffer.write(" " + dateTime.year.toString());
    return buffer.toString();
  }


}