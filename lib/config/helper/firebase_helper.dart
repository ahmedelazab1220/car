import 'dart:io';

import 'package:car_help/config/function/notification_service.dart';
import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background messages
}

class FirebaseHelper {
  Future<void> init({required BuildContext context}) async {
    if (Platform.isIOS) {
      await Firebase.initializeApp();
    } else {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }

    // Enable Firebase Analytics
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

    // Setup Crashlytics for error handling
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    // Initialize local notifications
    NotificationService().initNotification();

    // Handle background FCM messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Listen to foreground FCM messages
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        String userType =
            await CacheHelper().getUserType() ?? AppStrings.client;

        _handleForegroundMessage(message, context, userType);
      },
    );
  }

  /// Handle foreground FCM message and show notification.
  void _handleForegroundMessage(
      RemoteMessage message, BuildContext context, String userType) {
    if (message.notification != null) {
      NotificationService().showNotification(
        title: message.notification!.title ?? 'New Message',
        body: message.notification!.body ?? 'You have a new message',
      );
    }
    if (context.mounted) {
      // BlocProvider.of<NotificationsCubit>(context).getNotifications();
      if (userType == AppStrings.provider) {
        // BlocProvider.of<HomeProviderDataCubit>(context).getHomeProviderData();
      }
    }
  }
}
