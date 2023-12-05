import 'package:analytics_manager/pwc_analytics_manager/analytics_service/analytics_service.dart';
import 'package:analytics_manager/pwc_analytics_manager/enums/analytics_event.dart';
import 'package:analytics_manager/pwc_analytics_manager/enums/analytics_user_properties.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final class FirebaseAnalyticsService implements AnalyticsService {
  FirebaseAnalytics get _firebaseAnalytics => FirebaseAnalytics.instance;

  @override
  setUserId(String id) => _firebaseAnalytics.setUserId(id: id);

  @override
  setUserProperty(AnalyticsUserProperties property, dynamic value) =>
      _firebaseAnalytics.setUserProperty(name: property.key, value: value);

  @override
  trackEvent(AnalyticsEvent event, Map<String, dynamic> parameters) =>
      _firebaseAnalytics.logEvent(
          name: event.googleKey, parameters: parameters);

  @override
  setCurrentScreen(String screenName, [Map<String, dynamic>? parameters]) =>
      _firebaseAnalytics.setCurrentScreen(screenName: screenName);
}
