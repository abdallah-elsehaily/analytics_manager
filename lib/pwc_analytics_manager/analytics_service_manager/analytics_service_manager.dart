import '../analytics_service/analytics_service.dart';
import '../enums/analytics_event.dart';
import '../enums/analytics_user_properties.dart';

final class AnalyticsServiceManager {
  late final List<AnalyticsService> _analyticsServices;

  static AnalyticsServiceManager get instance {
   _instance ??=  AnalyticsServiceManager.initialize([]);
   return _instance!;
  }

  static AnalyticsServiceManager? _instance;

  factory AnalyticsServiceManager.initialize(List<AnalyticsService> services) {
    _instance = AnalyticsServiceManager._(services);
    return instance;
  }

  AnalyticsServiceManager._(this._analyticsServices);

  void setUserId(String id) =>
      _doForAllProviders((service) => service.setUserId(id));

  void setUserProperty(AnalyticsUserProperties property, dynamic value) =>
      _doForAllProviders(
          (provider) => provider.setUserProperty(property, value));

  void trackEvent(AnalyticsEvent event, Map<String, dynamic> parameters) =>
      _doForAllProviders((provider) => provider.trackEvent(event, parameters));

  void setCurrentScreen(String screenName) =>
      _doForAllProviders((provider) => provider.setCurrentScreen(screenName));

  void _doForAllProviders(Function(AnalyticsService service) action) =>
      _analyticsServices.forEach(action);
}
