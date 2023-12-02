enum AnalyticsEvent {
  purchase(googleKey: 'action_purchage', adjustKey: 'adj_purchase_event'),
  addToCart(googleKey: 'action_purchage', adjustKey: 'adj_purchase_event');

  final String googleKey;
  final String adjustKey;

  const AnalyticsEvent({required this.googleKey, required this.adjustKey});
}
