import '../enums/analytics_event.dart';
import '../enums/analytics_user_properties.dart';

abstract interface class CurrentPageTrackerAnalyticsService {
  Future<void> setCurrentScreen(String screenName,
      [Map<String, dynamic>? parameters]);
}

abstract interface class EventsLoggerAnalyticsService {
  Future<void> trackEvent(
      AnalyticsEvent event, Map<String, dynamic> parameters);
}

abstract interface class UserPropertiesAnalyticsService {
  Future<void> setUserId(String id);

  Future<void> setUserProperty(AnalyticsUserProperties property, dynamic value);
}

abstract interface class AnalyticsService
    implements
        UserPropertiesAnalyticsService,
        EventsLoggerAnalyticsService,
        CurrentPageTrackerAnalyticsService {}
