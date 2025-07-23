import 'package:flutter/foundation.dart';

/// This is base analytics event.
@immutable
abstract class AnalyticsEvent {
  /// This is base analytics event.
  const AnalyticsEvent();

  /// Implement this as the event name;
  String get eventName;

  /// optional properties of event.
  Map<String, String>? properties();
}
