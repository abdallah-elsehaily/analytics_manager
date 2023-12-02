import 'package:analytics_manager/pwc_analytics_manager/analytics_service/i_analytics_service.dart';
import 'package:analytics_manager/pwc_analytics_manager/enums/analytics_event.dart';
import 'package:analytics_manager/pwc_analytics_manager/enums/analytics_user_properties.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService implements IAnalyticsService {
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
  setCurrentScreen(String screenName) =>
      _firebaseAnalytics.setCurrentScreen(screenName: screenName);
}
