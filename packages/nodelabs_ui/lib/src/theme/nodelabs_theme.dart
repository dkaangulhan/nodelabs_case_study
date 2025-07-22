import 'package:flutter/material.dart';
import 'package:nodelabs_ui/src/theme/nodelabs_text_styles.dart';

/// {@template nodelabs_case_study_theme}
/// Nodelabs case study theme.
/// {@endtemplate}
class NodelabsCaseStudyTheme {
  /// {@macro nodelabs_case_study_theme}
  const NodelabsCaseStudyTheme();

  static const _primaryColor = Color(0xFFE50914);
  static const _black = Color(0xFF090909);
  static const _white = Color(0xFFFFFFFF);

  /// This is padding applied to home screen.
  static EdgeInsets homeScreenPadding(BuildContext context) {
    return MediaQuery.of(context).viewPadding;
  }

  /// Height for the bottom nav bar of home screen.
  static double get homeScreenBottomNavbarHeight => 50;

  /// [ThemeData] for the Nodelabs case study.
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        surface: _black,
        onSurface: _white,
      ),
      textTheme: const TextTheme(
        titleSmall: NodelabsTextStyles.titleSmall,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: NodelabsTextStyles.bodyNormal
            .copyWith(color: _white.withValues(alpha: 0.5)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _white.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _white.withValues(alpha: 0.5),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _primaryColor.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _primaryColor.withValues(alpha: 1),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        fillColor: _white.withValues(alpha: 0.1),
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 18),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          backgroundColor: WidgetStateColor.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return _white.withValues(alpha: 0.5);
              }
              return _primaryColor;
            },
          ),
          foregroundColor: WidgetStateColor.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return _black.withValues(alpha: 0.5);
              }
              return _white;
            },
          ),
        ),
      ),
    );
  }
}
