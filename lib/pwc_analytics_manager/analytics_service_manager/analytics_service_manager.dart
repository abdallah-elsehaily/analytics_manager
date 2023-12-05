import '../analytics_service/analytics_service.dart';
import '../enums/analytics_event.dart';
import '../enums/analytics_user_properties.dart';

final class AnalyticsServiceManager implements AnalyticsService {
  late final List<AnalyticsService> _analyticsServices;

  AnalyticsServiceManager.initialize(List<AnalyticsService> services)
      : _analyticsServices = services;

  @override
  Future<void> setUserId(String id) async {
    await _doForAllServices((service) => service.setUserId(id));
  }

  @override
  Future<void> setUserProperty(
      AnalyticsUserProperties property, dynamic value) async {
    await _doForAllServices(
        (service) => service.setUserProperty(property, value));
  }

  @override
  Future<void> trackEvent(
      AnalyticsEvent event, Map<String, dynamic> parameters) async {
    await _doForAllServices((service) => service.trackEvent(event, parameters));
  }

  @override
  Future<void> setCurrentScreen(String screenName,
      [Map<String, dynamic>? parameters]) async {
    await _doForAllServices((service) => service.setCurrentScreen(screenName));
  }

  Future<List<void>> _doForAllServices(
          Future<void> Function(AnalyticsService service) action) =>
      Future.wait(_analyticsServices.map(action).toList());
}
