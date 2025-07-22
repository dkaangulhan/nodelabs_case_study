import 'package:flutter/material.dart';

const _size = 44.0;

/// Circular button for the project.
///
/// The size of the button is 44x44;
class NodelabsCircularButton extends StatelessWidget {
  /// Circular button for the project.
  const NodelabsCircularButton({
    required this.child,
    this.onTap,
    super.key,
  });

  /// Child to place on the center of the button.
  final Widget child;

  /// on tap.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.onSurface.withValues(
              alpha: 0.1,
            ),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(
                alpha: 0.2,
              ),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
