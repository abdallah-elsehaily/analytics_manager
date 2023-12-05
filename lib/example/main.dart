import 'package:analytics_manager/example/my_app.dart';
import 'package:analytics_manager/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:analytics_manager/pwc_analytics_manager/pwc_analytics_manger.dart';
import 'package:get_it/get_it.dart';

import 'analytics_events_logger.dart';

void main() async {
  setUpGetItDI();
  runApp(const MyApp());
}

void setUpGetItDI() {
  var analyticsManagerService =
      AnalyticsServiceManager.initialize([FirebaseAnalyticsService()]);
  final getIt = GetIt.instance;
  getIt.registerSingleton<UserPropertiesAnalyticsService>(
      analyticsManagerService);
  getIt
      .registerSingleton<EventsLoggerAnalyticsService>(analyticsManagerService);
  getIt.registerSingleton<CurrentPageTrackerAnalyticsService>(
      analyticsManagerService);
  getIt.registerSingleton<AnalyticsService>(analyticsManagerService);
  getIt.registerSingleton<AnalyticsEventsLogger>(AnalyticsEventsLogger());
}


