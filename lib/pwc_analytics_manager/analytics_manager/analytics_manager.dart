import '../analytics_provider/i_analytics_provider.dart';
import '../enums/analytics_event.dart';
import '../enums/analytics_user_properties.dart';

final class AnalyticsManager {
  late final List<IAnalyticsProvider> _providers;

  static AnalyticsManager get instance => _instance!;

  static AnalyticsManager? _instance;

   AnalyticsManager.initialize(
      List<IAnalyticsProvider> providers) {
    _instance ??= AnalyticsManager._(providers);
  }
  AnalyticsManager._(this._providers);

  trackEvent(AnalyticsEvent event, Map<String, dynamic> parameters) =>
      _doForAllProviders((provider) => provider.trackEvent(event, parameters));

  setUserProperty(AnalyticsUserProperties property, dynamic value) =>
      _doForAllProviders(
          (provider) => provider.setUserProperty(property, value));

  setCurrentScreen(String screenName) =>
      _doForAllProviders((provider) => provider.trackScreenView(screenName));

  _doForAllProviders(Function(IAnalyticsProvider provider) action) =>
      _providers.forEach(action);
}
