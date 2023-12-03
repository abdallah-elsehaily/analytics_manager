import '../enums/analytics_event.dart';
import '../enums/analytics_user_properties.dart';

abstract interface class AnalyticsService {
  Future<void> setUserId(String id);

  Future<void> setUserProperty(AnalyticsUserProperties property, dynamic value);

  Future<void> trackEvent(
      AnalyticsEvent event, Map<String, dynamic> parameters);

  Future<void> setCurrentScreen(String screenName);
}
