import 'package:analytics_repository/src/models/analytics_event.dart';
import 'package:flutter/material.dart';

/// {@template analytics_repository}
/// This is sample analytics repository.
/// {@endtemplate}
class AnalyticsRepository {
  /// {@macro analytics_repository}
  const AnalyticsRepository();

  /// Tracks an event.
  Future<void> trackEvent(AnalyticsEvent event) async {
    debugPrint(
      '''Analytics event logged: ${event.eventName}, properties: ${event.properties()}''',
    );
  }
}
