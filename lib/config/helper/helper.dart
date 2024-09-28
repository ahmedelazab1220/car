import 'dart:core';
import 'dart:io';
import 'package:car_help/generated/l10n.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

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

String formatTimestamp(DateTime dateTime, BuildContext context) {
  final int currentSeconds = DateTime.now().difference(dateTime).inSeconds;

  if (currentSeconds < 60) {
    return S.of(context).now;
  } else if (currentSeconds < 3600) {
    return '${currentSeconds ~/ 60} ${S.of(context).minute}';
  } else if (currentSeconds < 86400) {
    return '${currentSeconds ~/ 3600} ${S.of(context).hour}';
  } else {
    final DateFormat dateFormat = DateFormat('dd MMM yyyy, HH:mm a');
    return dateFormat.format(dateTime);
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

Future<File> uriToFile(String urlString) async {
  Uri uri = Uri.parse(urlString);

  if (uri.scheme == 'file') {
    return File(uri.path);
  } else {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/tempfile');
    await http.Client().get(Uri.parse(uri.toString())).then((response) {
      tempFile.writeAsBytes(response.bodyBytes);
    });
    return tempFile;
  }
}
