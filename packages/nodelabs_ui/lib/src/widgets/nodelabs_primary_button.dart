import 'package:flutter/material.dart';

/// Primary button for the nodelabs project.
class NodelabsPrimaryButton extends StatelessWidget {
  /// Primary button for the nodelabs project.
  const NodelabsPrimaryButton({
    required this.title,
    this.onTap,
    super.key,
  });

  /// Title of the button.
  final String title;

  /// On tap callback.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(title),
    );
  }
}
