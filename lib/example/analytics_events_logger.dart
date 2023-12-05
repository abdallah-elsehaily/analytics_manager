import 'package:get_it/get_it.dart';
import '../pwc_analytics_manager/pwc_analytics_manger.dart';

const String _orderValueKey = 'orderValue';
const String _productName = 'productName';

 class AnalyticsEventsLogger {
  late final AnalyticsService _analyticsServiceManager;

  AnalyticsEventsLogger() {
    _analyticsServiceManager =
        GetIt.instance.get<AnalyticsService>();
  }

  logPurchaseEvent(double orderValue) {
    _analyticsServiceManager
        .trackEvent(AnalyticsEvent.purchase, {_orderValueKey: orderValue});
  }

  logAddingToCartEvent(String productName) {
    _analyticsServiceManager
        .trackEvent(AnalyticsEvent.addToCart, {_productName: productName});
  }

  setUserAge(double ageInYears) {
    _analyticsServiceManager.setUserProperty(
        AnalyticsUserProperties.userAge, ageInYears);
  }

  Future<void> setCurrentScreen(String screenName,
      [Map<String, dynamic>? parameters]) async {
    _analyticsServiceManager.setCurrentScreen(screenName, parameters);
  }
}
