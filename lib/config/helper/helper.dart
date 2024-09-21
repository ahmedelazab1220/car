import 'dart:core';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';

String deviceType() {
  if (Platform.isAndroid) {
    return 'android';
  } else if (Platform.isIOS) {
    return 'ios';
  } else {
    return 'unknown';
  }
}

Future<String?> messagingToken() async {
  String? token = await FirebaseMessaging.instance.getToken();

  return token;
}

Future refreshMessagesToken() async {
  FirebaseMessaging.instance.deleteToken();
  FirebaseMessaging.instance.onTokenRefresh;
}

String formatTimestamp(String dateTime) {
  final DateTime dateTimeObj = DateTime.parse(dateTime);
  final int currentSeconds = DateTime.now().difference(dateTimeObj).inSeconds;

  if (currentSeconds < 60) {
    return 'الان';
  } else if (currentSeconds < 3600) {
    return '${currentSeconds ~/ 60}دقيقة';
  } else if (currentSeconds < 86400) {
    return '${currentSeconds ~/ 3600}ساعة';
  } else {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    return dateFormat.format(dateTimeObj);
  }
}

String formatDateTime(String dateTime) {
  final DateTime dateTimeObj = DateTime.parse(dateTime);
  final int currentSeconds = DateTime.now().difference(dateTimeObj).inSeconds;

  if (currentSeconds < 60) {
    return 'الان';
  } else if (currentSeconds < 3600) {
    return '${currentSeconds ~/ 60}دقيقة';
  } else if (currentSeconds < 86400) {
    return '${currentSeconds ~/ 3600}ساعة';
  } else {
    final DateFormat dateFormat = DateFormat('HH:mm');
    return dateFormat.format(dateTimeObj);
  }
}

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);

  String formattedDate = DateFormat('dd MMM yyyy').format(date);

  return formattedDate;
}
