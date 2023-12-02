import '../enums/analytics_event.dart';
import '../enums/analytics_user_properties.dart';

abstract interface class IAnalyticsProvider {
  trackEvent(AnalyticsEvent event, Map<String, dynamic> parameters);
  setUserProperty(AnalyticsUserProperties property, dynamic value);
  trackScreenView(String screenName);
}
