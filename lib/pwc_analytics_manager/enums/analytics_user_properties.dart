enum AnalyticsUserProperties {
  userId(key: 'user_id_key'),
  userAge(key: 'user_age_key');

  final String key;

  const AnalyticsUserProperties({required this.key});
}
