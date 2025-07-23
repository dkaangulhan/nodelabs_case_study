import 'package:freezed_annotation/freezed_annotation.dart';

/// This is thrown when file being uploaded is too large.
@immutable
class EntityTooLargeException implements Exception {}
