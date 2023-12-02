import '../analytics_service/i_analytics_service.dart';
import '../enums/analytics_event.dart';
import '../enums/analytics_user_properties.dart';

final class AnalyticsServiceManager {
  late final List<IAnalyticsService> _analyticsServices;

  static AnalyticsServiceManager get instance => _instance!;

  static AnalyticsServiceManager? _instance;

  AnalyticsServiceManager.initialize(List<IAnalyticsService> services) {
    _instance ??= AnalyticsServiceManager._(services);
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

  void _doForAllProviders(Function(IAnalyticsService service) action) =>
      _analyticsServices.forEach(action);
}
