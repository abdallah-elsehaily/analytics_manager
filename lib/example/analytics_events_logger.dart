import '../pwc_analytics_manager/pwc_analytics_manger.dart';

const String _orderValueKey = 'orderValue';
const String _productName = 'productName';

class AnalyticsEventsLogger {
  AnalyticsEventsLogger._();

  static AnalyticsServiceManager get _analyticsManager => AnalyticsServiceManager.instance;

  static logPurchaseEvent(double orderValue) {
    _analyticsManager
        .trackEvent(AnalyticsEvent.purchase, {_orderValueKey: orderValue});
  }

  logAddingToCartEvent(String productName) {
    _analyticsManager
        .trackEvent(AnalyticsEvent.addToCart, {_productName: productName});
  }

  setUserAge(double ageInYears) {
    _analyticsManager.setUserProperty(
        AnalyticsUserProperties.userAge, ageInYears);
  }
}
