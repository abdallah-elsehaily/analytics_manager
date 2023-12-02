import 'package:analytics_manager/pwc_analytics_manager/screen_view_tracker/analytics_route_observer.dart';
import 'package:flutter/material.dart';
import 'package:analytics_manager/pwc_analytics_manager/analytics_provider/firebase_analytics_provider.dart';
import '../pwc_analytics_manager/analytics_manager/analytics_manager.dart';
import 'analytics_events_logger.dart';

void main() {
  AnalyticsManager.initialize(
      [FirebaseAnalyticsProvider(), AdjustAnalyticsProvider()]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      navigatorObservers: [
        AnalyticsRouteObserver()
      ],
      // A widget which will be started on application startup
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
          child: TextButton(
        child: const Text(
          'Hello, World!',
        ),
        onPressed: () {
          AnalyticsEventsLogger.logPurchaseEvent(500);
        },
      )),
    );
  }
}
