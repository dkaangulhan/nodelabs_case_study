import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Primary button for the nodelabs project.
class NodelabsFilledButton extends StatelessWidget {
  /// Primary button for the nodelabs project.
  const NodelabsFilledButton({
    required this.title,
    this.onTap,
    this.isLoading = false,
    super.key,
  });

  /// Title of the button.
  final String title;

  /// Whether the button in loading state.
  final bool isLoading;

  /// On tap callback.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onTap,
      child: !isLoading ? Text(title) : const CupertinoActivityIndicator(),
    );
  }
}
