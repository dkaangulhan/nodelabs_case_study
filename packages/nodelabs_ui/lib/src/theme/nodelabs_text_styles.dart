import 'package:flutter/material.dart';

/// {@template nodelabs_text_styles}
/// A collection of [TextStyle] objects used in the
/// Nodelabs Case Study.
/// {@endtemplate}
abstract class NodelabsTextStyles {
  // Title
  /// Small title text style.
  static const TextStyle titleSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  // Body
  /// Normal body text style.
  static const TextStyle bodyNormal = TextStyle(fontSize: 13);
}
