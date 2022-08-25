import 'package:intl/intl.dart';

DateTime getDateFromString(String date) {
  var parsedDate = DateTime.parse(date);
  return parsedDate;
}

String getFormatedDateFromString(String date) {
  List<String> splitedDate = date.split(' ');
  var parsedDate = DateTime.parse(splitedDate.first);
  return getFormatedDate(parsedDate);
} //'Wednesday, January 10, 2012'

String getFormatedDayFromString(String date) {
  var parsedDate = DateTime.parse(date);
  String newDate = getFormatedDay(parsedDate);
  return newDate;
}

String getFormatedTimeFromString(String date) {
  var parsedDate = DateTime.parse(date == '' ? '2013-04-20' : date);
  String newDate = getFormatedTime(parsedDate);
  return newDate;
} //'W

String getFormatedDate(DateTime date) => DateFormat('EEEE, dd MMMM yyyy').format(date);
String getFormatedTime(DateTime date) => DateFormat('hh:mm a').format(date);
String getFormatedMonth(DateTime date) => DateFormat('MMM').format(date); //Jan
String getFormatedYear(DateTime date) => DateFormat('yyyy').format(date); //2012
String getFormatedDay(DateTime date) => DateFormat('EEEE').format(date); //Wednesday
