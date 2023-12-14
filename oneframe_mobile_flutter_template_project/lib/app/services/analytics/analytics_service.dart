import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalyticsService {
  AnalyticsService._();

  static Future<void> logEvent({
    required String key,
    Map<String, Object?>? params,
  }) async {
    FirebaseAnalytics.instance.logEvent(name: key, parameters: params);
  }
}
