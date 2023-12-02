import '../pwc_analytics_manger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsProvider implements IAnalyticsProvider {
  FirebaseAnalytics get _firebaseAnalytics => FirebaseAnalytics.instance;

  @override
  trackEvent(AnalyticsEvent event, Map<String, dynamic> parameters) {
    _firebaseAnalytics.logEvent(name: event.googleKey, parameters: parameters);
  }

  @override
  setUserProperty(AnalyticsUserProperties property, dynamic value) {
    _firebaseAnalytics.setUserProperty(name: property.key, value: value);
  }

  @override
  trackScreenView(String screenName) {
    _firebaseAnalytics.logScreenView(screenName: screenName);
  }
}

class AdjustAnalyticsProvider implements IAnalyticsProvider {
  FirebaseAnalytics get _firebaseAnalytics => FirebaseAnalytics.instance;

  @override
  trackEvent(AnalyticsEvent event, Map<String, dynamic> parameters) {
    _firebaseAnalytics.logEvent(name: event.adjustKey, parameters: parameters);
  }

  @override
  setUserProperty(AnalyticsUserProperties property, dynamic value) {
    _firebaseAnalytics.setUserProperty(name: property.key, value: value);
  }

  @override
  trackScreenView(String screenName) {
    _firebaseAnalytics.logScreenView(screenName: screenName);
  }
}
