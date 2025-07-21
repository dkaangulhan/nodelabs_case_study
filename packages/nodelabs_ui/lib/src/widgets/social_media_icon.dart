import 'package:flutter/material.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

/// Social media icon
class SocialMediaIcon extends StatelessWidget {
  /// Social media icon
  const SocialMediaIcon({
    required this.iconPath,
    this.onTap,
    super.key,
  });

  /// asset path to the icon.
  final String iconPath;

  /// On tap.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(
                alpha: 0.2,
              ),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: SvgIcon(iconPath: iconPath),
          ),
        ),
      ),
    );
  }
}
